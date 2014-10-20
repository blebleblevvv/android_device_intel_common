#ifndef LINUX_XMM2230_SPI_H
#define LINUX_XMM2230_SPI_H

#define SPI_IOCTRL_MAGIC	0x78
/* IOCTL commands list */
#define SPI_IOC_FRAME_LEN_DOWNLOAD		_IO(SPI_IOCTRL_MAGIC, 1)
#define SPI_IOC_FRAME_LEN_NORMAL		_IO(SPI_IOCTRL_MAGIC, 2)

#endif
