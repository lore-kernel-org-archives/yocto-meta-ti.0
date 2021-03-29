Subject: No serial output on a custom AM3352 board
To: meta-ti@lists.yoctoproject.org
From: tagliapietra.alessandro@gmail.com
X-Originating-Location: Las Vegas, Nevada, US (72.207.140.105)
X-Originating-Platform: Linux Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 00:43:09 -0700
Message-ID: <28ma.1617003789931138360.Mb2u@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="TWFHOXAx6uTtcSfrB2Hp"

--TWFHOXAx6uTtcSfrB2Hp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

first time yocto user here, I'm trying to get a very minimal image to boot=
 on a AM3352 based device that a local company made, however when it boots =
there is no output on the serial port.

These are the steps I've tried:
- added meta-ti and dependent layers
- removed these features from the minimal image "alsa ext2 api-documentati=
on bluetooth ipv6 opengl pcmcia ppp ptest wayland wifi x11 vulkan" as I don=
't think are needed for our basic test
- taken the dtb file from the manufacturer sd card, converted to dts using=
 dtc, added to the kernel using a layer and changed=C2=A0KERNEL_DEVICETREE =
=
=3D "device-name-here.dtb"=C2=A0 (name replaced)
- I've cloned their SD card to make sure the partitions are the same (FAT1=
6 first partition with boot flag + ext4 second partition)
- bitbake build
- replaced MLO/u-boot.img in the boot partition
- extracted rootfs into the ext4 partition, copied zImage and the dtb file=
s in the /boot folder

I've also tried to use am335x-hs-evm as the machine (using also the UART v=
ariants of MLO and U-boot) but no luck.
In case it's needed, these are the env variables from their working SD car=
d u-boot

https://gist.github.com/alex88/5e8d604ab15540b84353040a83bc0606

What should I try to at least be able to get u-boot to output something in=
 the console?

Thank you in advance

--TWFHOXAx6uTtcSfrB2Hp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,<br /><br />first time yocto user here, I'm trying to get a =
very minimal image to boot on a AM3352 based device that a local company ma=
de, however when it boots there is no output on the serial port.<br /><br /=
>These are the steps I've tried:<br />&nbsp;- added meta-ti and dependent l=
ayers<br />&nbsp;- removed these features from the minimal image "alsa ext2=
 api-documentation bluetooth ipv6 opengl pcmcia ppp ptest wayland wifi x11 =
vulkan" as I don't think are needed for our basic test<br />&nbsp;- taken t=
he dtb file from the manufacturer sd card, converted to dts using dtc, adde=
d to the kernel using a layer and changed&nbsp;KERNEL_DEVICETREE =3D "devic=
e-name-here.dtb"&nbsp; (name replaced)<br />&nbsp;- I've cloned their SD ca=
rd to make sure the partitions are the same (FAT16 first partition with boo=
t flag + ext4 second partition)<br />&nbsp;- bitbake build<br />&nbsp;- rep=
laced MLO/u-boot.img in the boot partition<br />&nbsp;- extracted rootfs in=
to the ext4 partition, copied zImage and the dtb files in the /boot folder<=
br /><br />I've also tried to use am335x-hs-evm as the machine (using also =
the UART variants of MLO and U-boot) but no luck.<br />In case it's needed,=
 these are the env variables from their working SD card u-boot<br /><br />h=
ttps://gist.github.com/alex88/5e8d604ab15540b84353040a83bc0606<br /><br />W=
hat should I try to at least be able to get u-boot to output something in t=
he console?<br /><br />Thank you in advance

--TWFHOXAx6uTtcSfrB2Hp--
