

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

power[, 3] <- as.numeric(power[, 3])
power[, 4] <- as.numeric(power[, 4])
power[, 5] <- as.numeric(power[, 5])
power[, 6] <- as.numeric(power[, 6])
power[, 7] <- as.numeric(power[, 7])
power[, 8] <- as.numeric(power[, 8])
power[, 9] <- as.numeric(power[, 9])

power[, 1] <- as.Date(power$Date, "%d/%m/%Y")
power[, 1] <- format(power[, 1], "%m/%d/%Y")

power <- power[power$Date == "02/01/2007" | power$Date == "02/02/2007", ]

windows(480, 480)
par(bg = "white")

hist(power$Global_active_power/500, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))

dev.copy(png, file = "plot1.png")

dev.off()
