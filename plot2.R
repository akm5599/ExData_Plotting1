

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

power[, 3] <- as.numeric(power[, 3])
power[, 4] <- as.numeric(power[, 4])
power[, 5] <- as.numeric(power[, 5])
power[, 6] <- as.numeric(power[, 6])
power[, 7] <- as.numeric(power[, 7])
power[, 8] <- as.numeric(power[, 8])
power[, 9] <- as.numeric(power[, 9])

power[, 1] <- as.Date(power$Date, "%d/%m/%Y")
power[, 1] <- format(power[, 1], "%Y/%m/%d")

power <- power[power$Date == "2007/02/01" | power$Date == "2007/02/02", ]

power[, 10] <- paste(power$Date, power$Time, sep = " ")

power[, 10] <- ymd_hms(power[, 10])

windows(480, 480)

par(bg = "white")

plot(power[, 10], power$Global_active_power/500, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")

dev.off()


