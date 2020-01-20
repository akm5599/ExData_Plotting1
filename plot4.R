

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

par(mfrow = c(2, 2))

plot(power[, 10], power$Global_active_power/500, type = "l", ylab = "Global Active Power", xlab = "")

plot(power$V10, power$Voltage/100 + 226, type = "l", xlab = "datetime", ylab = "Voltage")

plot(power$V10, power$Sub_metering_1 - 2, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 33))
lines(power$V10, power$Sub_metering_2 - 2, col = "red")
lines(power$V10, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red", "blue"), cex = 0.8)

plot(power$V10, power$Global_reactive_power/400, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")

dev.off()


