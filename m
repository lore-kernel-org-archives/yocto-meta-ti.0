Return-Path: <dgross@intronik.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7680E00B66; Tue,  3 Jun 2014 02:57:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.180 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A590DE00AFD
	for <meta-ti@yoctoproject.org>; Tue,  3 Jun 2014 02:57:33 -0700 (PDT)
Received: by mail-ig0-f180.google.com with SMTP id c1so4548557igq.1
	for <meta-ti@yoctoproject.org>; Tue, 03 Jun 2014 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intronik.de; s=intronik;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1nldor9pqHWUj46xPFxq1C0d75t1Hpldqfi9Sm3nJ4Q=;
	b=EgAy/B7/YPApPkPZHwDnbTeg1P/viElzg+qKyiVAYrrgcTc4T6RHa3BE5XzKiG7Yv3
	h8zX+j+ZRmHXS6FcT5zMYUQSsoCUEkJV6Xuchl5uCrK0BEwVCGYvmrIo3I5BIpry9AZI
	BweIZd7RlJOSYzTvkiOpLgVLRYPvR8g6aKfww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=1nldor9pqHWUj46xPFxq1C0d75t1Hpldqfi9Sm3nJ4Q=;
	b=Zq+Q3SPcnL7zFIc76ETT+RGU97vkhsrrKg4QQAyFRdLUfEkIr95SFLQxd9zXlXeu3B
	JzfSG83SXdhpy3wwLNCAMCAitpTPOJjrcjhCJgb4Zt2EH7NQ5ARWqsOYTxOD09yoLves
	K77ZIOLl4C3NpO4M5eNiF9fEmaYXKDfnwU6B6wN0YJrhiQeytoAQzYCUVG8N212MrvJi
	QHcNgAqgqWp1tTEoL8rTUrPp+YdZ4uQB+sURZl8wMeWmyVaJoiwPvTCndlYi8CntINQh
	CMHRFQZ6Xhjcn1UkHKrRSUndSi1o0WO5Y2DTVq7dqmT14U++9b8hds6OvcExUs2sBD/m
	yG6A==
X-Gm-Message-State: ALoCoQne7326ynXw3LUENQGYUfOhRWTO+O/7qySjAdxqNJ3gdXZRg/2KErYSe0ISjMWjNp8QrAw8
MIME-Version: 1.0
X-Received: by 10.50.18.12 with SMTP id s12mr10472498igd.22.1401789452474;
	Tue, 03 Jun 2014 02:57:32 -0700 (PDT)
Received: by 10.64.27.136 with HTTP; Tue, 3 Jun 2014 02:57:32 -0700 (PDT)
Date: Tue, 3 Jun 2014 11:57:32 +0200
Message-ID: <CAJ0JmfUT1z7Y5QZthVamzsTBqMZ-L2RZvNAEdbc1A0iuFVY7vg@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIEdyb8Of?= <dgross@intronik.de>
To: meta-ti@yoctoproject.org
Subject: beaglebone black usb device problem (daisy)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jun 2014 09:57:34 -0000
Content-Type: multipart/alternative; boundary=089e014947b45d73d004faeb8a61

--089e014947b45d73d004faeb8a61
Content-Type: text/plain; charset=UTF-8

Hello there,
I have successfully build several beaglebone (qt4embedded demo and
sato+mono hard float) images using yocto 1.6 (daisy) for the beagle bone
black.

However USB devices (mouse, keyboard, anything) are only found during the
first boot.

I narrowed the problem down to the file "/etc/udev/cache.data". If I remove
this file and boot again (using the serial console), USB works once for the
next boot process.

After some try and error, I was able to restart the USB enumeration by
issuing a "udevadm trigger" command again using the serial console. That
always works. To me it seems that USB root hub is not loaded by udev if the
/etc/udev/cache.data file exists.

The output of the trigger command is:
root@beaglebone:~# udevadm trigger
udevadm trigger
47401300.usb-phy supply vcc not found, using dummy regulator
47401b00.usb-phy supply vcc not found, using dummy regulator
omap_rng 48310000.rng: OMAP Random Number Generator ver. 20
root@beaglebone:~# musb-hdrc musb-hdrc.0.auto: MUSB HDRC host driver
musb-hdrc musb-hdrc.0.auto: new USB bus registered, assigned bus number 1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
musb-hdrc musb-hdrc.1.auto: MUSB HDRC host driver
musb-hdrc musb-hdrc.1.auto: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
usb 2-1: new low-speed USB device number 2 using musb-hdrc
input: Logitech USB Optical Mouse as
/devices/ocp.3/47400000.usb/47401c00.usb/musb-hdrc.1.auto/usb2/2-1/2-1:1.0/0003:046D:C00C.0001/input/input0
hid-generic 0003:046D:C00C.0001: input: USB HID v1.10 Mouse [Logitech USB
Optical Mouse] on usb-musb-hdrc.1.auto-1/input0

The content of the /etc/udev/cache.data file is:
root@beaglebone:~# cat /etc/udev/cache.data
cat /etc/udev/cache.data
Linux version 3.14.0-yocto-standard (daniel@daniel-ubuntu) (gcc version
4.8.2 (GCC) ) #1 PREEMPT Sat May 24 16:40:23 CEST
2014console=ttyO0,115200n8 root=/dev/mmcblk0p2 ro rootfstype=ext4
rootwaitCharacter devices:1 mem2 pty3 ttyp4 /dev/vc/04 tty5 /dev/tty5
/dev/console5 /dev/ptmx7 vcs10 misc13 input29 fb89 i2c90 mtd128 ptm136
pts180 usb189 usb_device226 drm250 ttySDIO251 ttyO252 bsg253 watchdog254
rtcBlock devices:1 ramdisk259 blkext8 sd31 mtdblock65 sd66 sd67 sd68 sd69
sd70 sd71 sd128 sd129 sd130 sd131 sd132 sd133 sd134 sd135 sd179 mmc


For the sake of completeness:
root@beaglebone:~# uname -a
uname -a
Linux beaglebone 3.14.0-yocto-standard #1 PREEMPT Sat May 24 16:40:23 CEST
2014 armv7l GNU/Linux


Did anyone else see these problems? And is this a bug - or a feature?


Daniel

--089e014947b45d73d004faeb8a61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello there,</div><div>I have successfully build seve=
ral beaglebone (qt4embedded demo and sato+mono hard float) images using yoc=
to 1.6 (daisy) for the beagle bone black.</div><div><br></div><div>However =
USB devices (mouse, keyboard, anything) are only found during the first boo=
t.</div>
<div><br></div><div>I narrowed the problem down to the file &quot;/etc/udev=
/cache.data&quot;. If I remove this file and boot again (using the serial c=
onsole), USB works once for the next boot process.</div><div><br></div>
<div>After some try and error, I was able to restart the USB enumeration by=
 issuing a &quot;udevadm trigger&quot; command again using the serial conso=
le. That always works. To me it seems that USB root hub is not loaded by ud=
ev if the /etc/udev/cache.data file exists.</div>
<div><br></div><div>The output of the trigger command is:</div><div>root@be=
aglebone:~# udevadm trigger<br></div><div><div>udevadm trigger</div><div>47=
401300.usb-phy supply vcc not found, using dummy regulator</div><div>47401b=
00.usb-phy supply vcc not found, using dummy regulator</div>
<div>omap_rng 48310000.rng: OMAP Random Number Generator ver. 20</div><div>=
root@beaglebone:~# musb-hdrc musb-hdrc.0.auto: MUSB HDRC host driver</div><=
div>musb-hdrc musb-hdrc.0.auto: new USB bus registered, assigned bus number=
 1</div>
<div>hub 1-0:1.0: USB hub found</div><div>hub 1-0:1.0: 1 port detected</div=
><div>musb-hdrc musb-hdrc.1.auto: MUSB HDRC host driver</div><div>musb-hdrc=
 musb-hdrc.1.auto: new USB bus registered, assigned bus number 2</div><div>
hub 2-0:1.0: USB hub found</div><div>hub 2-0:1.0: 1 port detected</div><div=
>usb 2-1: new low-speed USB device number 2 using musb-hdrc</div><div>input=
: Logitech USB Optical Mouse as /devices/ocp.3/47400000.usb/47401c00.usb/mu=
sb-hdrc.1.auto/usb2/2-1/2-1:1.0/0003:046D:C00C.0001/input/input0</div>
<div>hid-generic 0003:046D:C00C.0001: input: USB HID v1.10 Mouse [Logitech =
USB Optical Mouse] on usb-musb-hdrc.1.auto-1/input0</div></div><div><br></d=
iv><div>The content of the /etc/udev/cache.data file is:</div><div><div>
root@beaglebone:~# cat /etc/udev/cache.data</div><div>cat /etc/udev/cache.d=
ata</div><div>Linux version 3.14.0-yocto-standard (daniel@daniel-ubuntu) (g=
cc version 4.8.2 (GCC) ) #1 PREEMPT Sat May 24 16:40:23 CEST 2014console=3D=
ttyO0,115200n8 root=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 rootwaitCharacter=
 devices:1 mem2 pty3 ttyp4 /dev/vc/04 tty5 /dev/tty5 /dev/console5 /dev/ptm=
x7 vcs10 misc13 input29 fb89 i2c90 mtd128 ptm136 pts180 usb189 usb_device22=
6 drm250 ttySDIO251 ttyO252 bsg253 watchdog254 rtcBlock devices:1 ramdisk25=
9 blkext8 sd31 mtdblock65 sd66 sd67 sd68 sd69 sd70 sd71 sd128 sd129 sd130 s=
d131 sd132 sd133 sd134 sd135 sd179 mmc</div>
<div><br></div></div><div><br></div><div>For the sake of completeness:</div=
><div><div>root@beaglebone:~# uname -a</div><div>uname -a</div><div>Linux b=
eaglebone 3.14.0-yocto-standard #1 PREEMPT Sat May 24 16:40:23 CEST 2014 ar=
mv7l GNU/Linux</div>
</div><div><br></div><div><br></div><div>Did anyone else see these problems=
? And is this a bug - or a feature?</div><div><br></div><div><div dir=3D"lt=
r"><span style=3D"background-color:rgb(255,255,255)"><br>Daniel<br><br></sp=
an></div>
</div>
</div>

--089e014947b45d73d004faeb8a61--
