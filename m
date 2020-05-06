Subject: meta-ti setup suggestions for beaglebone (SoC AM335x)
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: San Pietro Mussolino, Veneto, IT (185.126.142.92)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 06 May 2020 04:08:03 -0700
Message-ID: <BfLY.1588763283272971866.HOsc@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0YR8le7ogqBER6zdxXgB"

--0YR8le7ogqBER6zdxXgB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

as others before me, I am trying to use poky and meta-ti to customize Yoct=
o to run on the Beaglebone Black (and Green).
The reason to use the meta-ti layer is to get the drivers for the PowerVR =
GPU and for the PRUs.

At the moment I have used meta-ti zeus branch and I have been able to comp=
ile both core-image-minimal and core-image-base.
Both compilations have been successful but when I try to load the generate=
d wic.xz images in the beaglebone through the MMC the board does not boot.
The same images using meta-yocto-bsp (instead of meta-ti) and setting the =
machine to beaglebone-yocto are booting fine.
Therefore, before going further with the tests, I have decided to check if=
 the initial assumptions/the current setup are correct.

I have seen a few threads here in the mailing list with a similar=C2=A0top=
ic, the last ones being:

* [meta-ti] Getting Started with meta-ti "rocko" and beaglebone black (BBB=
) ( https://www.yoctoproject.org/pipermail/meta-ti/2018-August/011034.html =
)
* [meta-ti] Poky and meta-ti advice for Beaglebone Black ( https://www.yoc=
toproject.org/pipermail/meta-ti/2018-September/011179.html )
* [meta-ti] Building for AM335x with meta-ti and meta-qt5 ( https://www.yo=
ctoproject.org/pipermail/meta-ti/2019-July/012020.html )

There is a nice presentation too Working with meta-ti - Yocto Project Wiki=
 ( https://wiki.yoctoproject.org/wiki/images/b/b3/Meta-ti.pdf ) , but it se=
ems to be outdated.

Even considering the documentation above I still have a few doubts:
* I don't get which is the branch expected to work for every SOC (possibly=
 different depending on the SOC). At the moment I am interested in the amx3=
35 SOC used for both the beaglebone black and green. Is there in the reposi=
tory a note in a readme explaining the combinations that are expected to wo=
rk?
* which are the differences between the machines am335-evm and beaglebone?=
 "Only" the=C2=A0KERNEL_DEVICETREE setup? Are the differences summarized so=
mewhere?
* given that I can test the resulting distro on a beaglebone green should =
I try to set the machine to beaglebone or to am335-evm and customize the uE=
nv.txt? Which is the suggested/supported approach? I see that in the past i=
t has been suggested to use the am335-evm, but probably that suggestion is =
outdated now.
* when using meta-ti, is it suggested to add the meta-yocto-bsp layer in t=
he=C2=A0bblayers.conf or not? There are threads and patches (added and reve=
rted) about that, but I am not sue about the updated verdict
As explained above I am not sure witch branch or tag is expected to work w=
ith MACHINE=3Dbeaglebone.
I am currently using:

* meta-ti: branch zeus,=C2=A0commit=C2=A01dd4558
* poky: branch zeus,=C2=A0commit ca9cc50
* meta-openembedded: branch zeus, commit 44e458f

Anyway here you have the two boot log:
* the first one is ok and has been obtained using meta-yocto-bsp
* the second one is giving the error "## Error: "bootcmd_nand0" not define=
d" followed by others
Log 1
U-Boot 2019.07 (May 05 2020 - 16:35:11 +0000)

CPU=C2=A0 : AM335X-GP rev 2.1
Model: TI AM335x BeagleBone Black
DRAM:=C2=A0 512 MiB
NAND:=C2=A0 0 MiB
MMC:=C2=A0 =C2=A0OMAP SD/MMC: 0, OMAP SD/MMC: 1
Loading Environment from FAT... *** Warning - bad CRC, using default envir=
onment

<ethaddr> not set. Validating first E-fuse MAC
Net:=C2=A0 =C2=A0eth0: ethernet@4a100000
Warning: usb_ether MAC addresses don't match:
Address in ROM is=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 de:ad:be:ef:00:01
Address in environment is=C2=A0 c8:fd:19:c6:c2:93
, eth1: usb_ether
Hit any key to stop autoboot:=C2=A0 0
switch to partitions #0, OK
mmc0 is current device
SD/MMC found on device 0
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found /extlinux/extlinux.conf
Retrieving file: /extlinux/extlinux.conf
119 bytes read in 2 ms (57.6 KiB/s)
1:=C2=A0 =C2=A0 =C2=A0 Yocto
Retrieving file: /zImage
4755816 bytes read in 305 ms (14.9 MiB/s)
append: root=3DPARTUUID=3D00033363-02 rootwait console=3DttyS0,115200
Retrieving file: /am335x-bonegreen.dtb
56060 bytes read in 6 ms (8.9 MiB/s)
## Flattened Device Tree blob at 88000000
Booting using the fdt blob at 0x88000000
Loading Device Tree to 8ffef000, end 8ffffafb ... OK

Log 2

U-Boot 2020.01-gae8ceb7b6e (May 04 2020 - 18:55:25 +0000)

CPU=C2=A0 : AM335X-GP rev 2.1
Model: TI AM335x BeagleBone Black
DRAM:=C2=A0 512 MiB
WDT:=C2=A0 =C2=A0Started with servicing (60s timeout)
NAND:=C2=A0 0 MiB
MMC:=C2=A0 =C2=A0OMAP SD/MMC: 0, OMAP SD/MMC: 1
Loading Environment from FAT... *** Warning - bad CRC, using default envir=
onment

<ethaddr> not set. Validating first E-fuse MAC
Net:=C2=A0 =C2=A0eth0: ethernet@4a100000
Warning: usb_ether MAC addresses don't match:
Address in ROM is=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 de:ad:be:ef:00:01
Address in environment is=C2=A0 c8:fd:19:c6:c2:93
, eth1: usb_ether
Hit any key to stop autoboot:=C2=A0 0
switch to partitions #0, OK
mmc0 is current device
SD/MMC found on device 0
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
switch to partitions #0, OK
mmc0 is current device
SD/MMC found on device 0
switch to partitions #0, OK
mmc1(part 0) is current device
** No partition table - mmc 1 **
switch to partitions #0, OK
mmc1(part 0) is current device
SD/MMC found on device 1
** No partition table - mmc 1 **
## Error: "bootcmd_nand0" not defined
starting USB...
Bus usb@47401800: Port not available.
ethernet@4a100000 Waiting for PHY auto negotiation to complete............=
...................................................................... done
link up on port 0, speed 100, full duplex
BOOTP broadcast 1
BOOTP broadcast 2
BOOTP broadcast 3
DHCP client bound to address 192.168.0.16 (900 ms)
*** ERROR: `serverip' not set
Cannot autoload with TFTPGET
missing environment variable: pxeuuid
Retrieving file: pxelinux.cfg/01-c8-fd-19-c6-c2-91
link up on port 0, speed 100, full duplex
*** ERROR: `serverip' not set
Retrieving file: pxelinux.cfg/C0A80010
link up on port 0, speed 100, full duplex
*** ERROR: `serverip' not set
Retrieving file: pxelinux.cfg/C0A8001
link up on port 0, speed 100, full duplex

Any suggestion would be very much appreciated.

Luca

--0YR8le7ogqBER6zdxXgB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,<br /><br />as others before me, I am&nbsp;<span style=3D"color: #22=
2222; font-family: 'Helvetica Neue', Arial, sans-serif; font-size: 15px;">t=
rying to use poky and meta-ti to customize Yocto to run on the Beaglebone B=
lack (and Green).<br />The reason to use the meta-ti layer is to get the dr=
ivers for the PowerVR GPU and for the PRUs.<br /><br /></span><span style=
=3D"color: #222222; font-family: 'Helvetica Neue', Arial, sans-serif; font=
-size: 15px;">At the moment I have used meta-ti zeus branch and I have been=
 able to compile both core-image-minimal and core-image-base.</span><br /><=
span style=3D"color: #222222; font-family: 'Helvetica Neue', Arial, sans-se=
rif; font-size: 15px;">Both compilations have been successful but when I tr=
y to load the generated wic.xz images in the beaglebone through the MMC the=
 board does not boot.<br /></span>The same images using meta-yocto-bsp (ins=
tead of meta-ti) and setting the machine to beaglebone-yocto are booting fi=
ne.<br /><span style=3D"color: #222222; font-family: 'Helvetica Neue', Aria=
l, sans-serif; font-size: 15px;">Therefore, before going further with the t=
ests, I have decided to check if the initial assumptions/the current setup =
are correct.</span><br /><br /><span style=3D"color: #222222; font-family: =
Helvetica Neue, Arial, sans-serif;"><span style=3D"font-size: 15px;">I have=
 seen a few threads here in the mailing list with a similar&nbsp;topic, the=
 last ones being:</span></span><br />
<ul>
<li><a href=3D"https://www.yoctoproject.org/pipermail/meta-ti/2018-August/=
011034.html" target=3D"_blank" rel=3D"nofollow noopener">[meta-ti] Getting =
Started with meta-ti "rocko" and beaglebone black (BBB)</a></li>
<li><a href=3D"https://www.yoctoproject.org/pipermail/meta-ti/2018-Septemb=
er/011179.html" target=3D"_blank" rel=3D"nofollow noopener">[meta-ti] Poky =
and meta-ti advice for Beaglebone Black</a></li>
<li><a href=3D"https://www.yoctoproject.org/pipermail/meta-ti/2019-July/01=
2020.html" target=3D"_blank" rel=3D"nofollow noopener">[meta-ti] Building f=
or AM335x with meta-ti and meta-qt5</a></li>
</ul>
There is a nice presentation too&nbsp;<a href=3D"https://wiki.yoctoproject=
.org/wiki/images/b/b3/Meta-ti.pdf" target=3D"_blank" rel=3D"nofollow noopen=
er">Working with meta-ti - Yocto Project Wiki</a>, but it seems to be outda=
ted.<br /><br />Even considering the documentation above I still have a few=
 doubts:<br />
<ol>
<li>I don't get which is the branch expected to work for every SOC (possib=
ly different depending on the SOC). At the moment I am interested in the am=
x335 SOC used for both the beaglebone black and green. Is there in the repo=
sitory a note in a readme explaining the combinations that are expected to =
work?</li>
<li>which are the differences between the machines am335-evm and beaglebon=
e? "Only" the&nbsp;KERNEL_DEVICETREE setup? Are the differences summarized =
somewhere?</li>
<li>given that I can test the resulting distro on a beaglebone green shoul=
d I try to set the machine to beaglebone or to am335-evm and customize the =
uEnv.txt? Which is the suggested/supported approach? I see that in the past=
 it has been suggested to use the am335-evm, but probably that suggestion i=
s outdated now.</li>
<li>when using meta-ti, is it suggested to add the meta-yocto-bsp layer in=
 the&nbsp;bblayers.conf or not? There are threads and patches (added and re=
verted) about that, but I am not sue about the updated verdict</li>
</ol>
As explained above I am not sure witch branch or tag is expected to work w=
ith MACHINE=3Dbeaglebone.<br />I am currently using:<br />
<ul>
<li>meta-ti: branch zeus,&nbsp;commit&nbsp;1dd4558</li>
<li>poky: branch zeus,&nbsp;commit ca9cc50</li>
<li>meta-openembedded: branch zeus, commit 44e458f</li>
</ul>
Anyway here you have the two boot log:<br />
<ol>
<li>the first one is ok and has been obtained using meta-yocto-bsp</li>
<li>the second one is giving the error "## Error: "bootcmd_nand0" not defi=
ned" followed by others</li>
</ol>
<div><span><span>Log 1<br />&nbsp; &nbsp; U-Boot 2019.07 (May 05 2020 - 16=
:35:11 +0000)<br /><br /></span></span>
<div>
<div>&nbsp; &nbsp; CPU&nbsp; : AM335X-GP rev 2.1</div>
<div>&nbsp; &nbsp; Model: TI AM335x BeagleBone Black</div>
<div>&nbsp; &nbsp; DRAM:&nbsp; 512 MiB</div>
<div>&nbsp; &nbsp; NAND:&nbsp; 0 MiB</div>
<div>&nbsp; &nbsp; MMC:&nbsp; &nbsp;OMAP SD/MMC: 0, OMAP SD/MMC: 1</div>
<div>&nbsp; &nbsp; Loading Environment from FAT... *** Warning - bad CRC, =
using default environment</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; &lt;ethaddr&gt; not set. Validating first E-fuse MAC</d=
iv>
<div>&nbsp; &nbsp; Net:&nbsp; &nbsp;eth0: ethernet@4a100000</div>
<div>&nbsp; &nbsp; Warning: usb_ether MAC addresses don't match:</div>
<div>&nbsp; &nbsp; Address in ROM is&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; de:=
ad:be:ef:00:01</div>
<div>&nbsp; &nbsp; Address in environment is&nbsp; c8:fd:19:c6:c2:93</div>
<div>&nbsp; &nbsp; , eth1: usb_ether</div>
<div>&nbsp; &nbsp; Hit any key to stop autoboot:&nbsp; 0</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc0 is current device</div>
<div>&nbsp; &nbsp; SD/MMC found on device 0</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc0 is current device</div>
<div>&nbsp; &nbsp; Scanning mmc 0:1...</div>
<div>&nbsp; &nbsp; Found /extlinux/extlinux.conf</div>
<div>&nbsp; &nbsp; Retrieving file: /extlinux/extlinux.conf</div>
<div>&nbsp; &nbsp; 119 bytes read in 2 ms (57.6 KiB/s)</div>
<div>&nbsp; &nbsp; 1:&nbsp; &nbsp; &nbsp; Yocto</div>
<div>&nbsp; &nbsp; Retrieving file: /zImage</div>
<div>&nbsp; &nbsp; 4755816 bytes read in 305 ms (14.9 MiB/s)</div>
<div>&nbsp; &nbsp; append: root=3DPARTUUID=3D00033363-02 rootwait console=
=3DttyS0,115200</div>
<div>&nbsp; &nbsp; Retrieving file: /am335x-bonegreen.dtb</div>
<div>&nbsp; &nbsp; 56060 bytes read in 6 ms (8.9 MiB/s)</div>
<div>&nbsp; &nbsp; ## Flattened Device Tree blob at 88000000</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;Booting using the fdt blob at 0x88000000</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;Loading Device Tree to 8ffef000, end 8ffff=
afb ... OK<br /><br />Log 2<br /><br />
<div>&nbsp; &nbsp; U-Boot 2020.01-gae8ceb7b6e (May 04 2020 - 18:55:25 +000=
0)</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; CPU&nbsp; : AM335X-GP rev 2.1</div>
<div>&nbsp; &nbsp; Model: TI AM335x BeagleBone Black</div>
<div>&nbsp; &nbsp; DRAM:&nbsp; 512 MiB</div>
<div>&nbsp; &nbsp; WDT:&nbsp; &nbsp;Started with servicing (60s timeout)</=
div>
<div>&nbsp; &nbsp; NAND:&nbsp; 0 MiB</div>
<div>&nbsp; &nbsp; MMC:&nbsp; &nbsp;OMAP SD/MMC: 0, OMAP SD/MMC: 1</div>
<div>&nbsp; &nbsp; Loading Environment from FAT... *** Warning - bad CRC, =
using default environment</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; &lt;ethaddr&gt; not set. Validating first E-fuse MAC</d=
iv>
<div>&nbsp; &nbsp; Net:&nbsp; &nbsp;eth0: ethernet@4a100000</div>
<div>&nbsp; &nbsp; Warning: usb_ether MAC addresses don't match:</div>
<div>&nbsp; &nbsp; Address in ROM is&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; de:=
ad:be:ef:00:01</div>
<div>&nbsp; &nbsp; Address in environment is&nbsp; c8:fd:19:c6:c2:93</div>
<div>&nbsp; &nbsp; , eth1: usb_ether</div>
<div>&nbsp; &nbsp; Hit any key to stop autoboot:&nbsp; 0</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc0 is current device</div>
<div>&nbsp; &nbsp; SD/MMC found on device 0</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc0 is current device</div>
<div>&nbsp; &nbsp; Scanning mmc 0:1...</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc0 is current device</div>
<div>&nbsp; &nbsp; SD/MMC found on device 0</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc1(part 0) is current device</div>
<div>&nbsp; &nbsp; ** No partition table - mmc 1 **</div>
<div>&nbsp; &nbsp; switch to partitions #0, OK</div>
<div>&nbsp; &nbsp; mmc1(part 0) is current device</div>
<div>&nbsp; &nbsp; SD/MMC found on device 1</div>
<div>&nbsp; &nbsp; ** No partition table - mmc 1 **</div>
<div>&nbsp; &nbsp; ## Error: "bootcmd_nand0" not defined</div>
<div>&nbsp; &nbsp; starting USB...</div>
<div>&nbsp; &nbsp; Bus usb@47401800: Port not available.</div>
<div>&nbsp; &nbsp; ethernet@4a100000 Waiting for PHY auto negotiation to c=
omplete....................................................................=
.............. done</div>
<div>&nbsp; &nbsp; link up on port 0, speed 100, full duplex</div>
<div>&nbsp; &nbsp; BOOTP broadcast 1</div>
<div>&nbsp; &nbsp; BOOTP broadcast 2</div>
<div>&nbsp; &nbsp; BOOTP broadcast 3</div>
<div>&nbsp; &nbsp; DHCP client bound to address 192.168.0.16 (900 ms)</div=
>
<div>&nbsp; &nbsp; *** ERROR: `serverip' not set</div>
<div>&nbsp; &nbsp; Cannot autoload with TFTPGET</div>
<div>&nbsp; &nbsp; missing environment variable: pxeuuid</div>
<div>&nbsp; &nbsp; Retrieving file: pxelinux.cfg/01-c8-fd-19-c6-c2-91</div=
>
<div>&nbsp; &nbsp; link up on port 0, speed 100, full duplex</div>
<div>&nbsp; &nbsp; *** ERROR: `serverip' not set</div>
<div>&nbsp; &nbsp; Retrieving file: pxelinux.cfg/C0A80010</div>
<div>&nbsp; &nbsp; link up on port 0, speed 100, full duplex</div>
<div>&nbsp; &nbsp; *** ERROR: `serverip' not set</div>
<div>&nbsp; &nbsp; Retrieving file: pxelinux.cfg/C0A8001</div>
<div>&nbsp; &nbsp; link up on port 0, speed 100, full duplex</div>
</div>
</div>
<span><br />Any suggestion would be very much appreciated.<br /><br /></sp=
an></div>
<span style=3D"color: #222222; font-family: 'Helvetica Neue', Arial, sans-=
serif; font-size: 15px;">Luca</span>

--0YR8le7ogqBER6zdxXgB--
