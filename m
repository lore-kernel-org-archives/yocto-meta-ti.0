Return-Path: <sudhangathan@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 312B7E013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 19:24:05 -0700 (PDT)
Received: by mail-qc0-f182.google.com with SMTP id e10so2669773qcy.41
	for <meta-ti@yoctoproject.org>; Mon, 08 Jul 2013 19:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8ZJ+2il9Mm6BVoBM64vfTxdmvWnhZbW/obburSXXD/4=;
	b=0z3PS/YcUFoAVNhL/D0nfxE+r/plVFuah+8fIHz8MbBXXevLfIbe02dJHgYWjGOlQI
	bcpnSVtc5OomlZqomgZrZUdrIzqxP14nbek1FG3PdC4rvtwCHjCsws7n4a5cCXoVg8U9
	1B5wijn3iFFupMJEEonJbS9wiFAgGD/XcY56nCn7/qGa8Tc6sRYIucXjOVOAAfn5+6D5
	+QPlaF+4PxS4rGT0OtYfXz53SeZ9h09XAoUwoGQQVCCQctHQ33KcdrxTe3k4WJh6sBuN
	ukNAasyvK5EoBiN7ch6nb3EZ8QyAsLwSylzMJ1hsZXKLhU56cYiIp8dHCGUKqTBBiM6W
	UL1g==
X-Received: by 10.49.117.195 with SMTP id kg3mr18668990qeb.68.1373336645037;
	Mon, 08 Jul 2013 19:24:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.95.9 with HTTP; Mon, 8 Jul 2013 19:23:44 -0700 (PDT)
In-Reply-To: <CAOCHtYgPdfsXQnmCMT0t1hETrtocmV=AEpXdH_gd6ukw-70_sg@mail.gmail.com>
References: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
	<CAOCHtYgPdfsXQnmCMT0t1hETrtocmV=AEpXdH_gd6ukw-70_sg@mail.gmail.com>
From: Sudhangathan B S <sudhangathan@gmail.com>
Date: Tue, 9 Jul 2013 07:53:44 +0530
Message-ID: <CAGX3a98VeXEX9DsU684t1d=_EpvSdftZVd=SuaHCKdpxSH+RNg@mail.gmail.com>
To: will.frazer@eurotech.com, christopher.pow@honeywell.com, 
	robertcnelson@gmail.com
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: booting 2.6.32 kernel and rootfs
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
X-List-Received-Date: Tue, 09 Jul 2013 02:24:07 -0000
Content-Type: multipart/alternative; boundary=047d7b5da46fe2751b04e10ada30

--047d7b5da46fe2751b04e10ada30
Content-Type: text/plain; charset=ISO-8859-1

I tried ttyO0 and ttyS2.. for some reason both did not work.. I am getting
the same output, i.e. it freezes after "...... done booting the kernel"

I made these changes through the file uEnv.txt, and therefore the error **
Unable to read "uEnv.txt" from mmc 0:1 ** doesn't come anymore..!

I was also reading
http://processors.wiki.ti.com/index.php/Kernel_-_Common_Problems_Booting_Linuxand
also enabled "
CONFIG_DEBUG_LL" in the config file using the bitbake -c menuconfig
virtual/kernel command, but that did not take much affect.

I have pasted below the console output and the uEnv.txt

******Console Start**********************
********************************************
U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)

OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0
*** Warning - readenv() failed, using default environment

In:    serial
Out:   serial
Err:   serial
Beagle xM Rev C
No EEPROM on expansion board
I2C read: I/O error
Unrecognized expansion board: 0
Die ID #689000029ff80000016842c81202f014
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
The user button is currently NOT pressed.
SD/MMC found on device 0
reading uEnv.txt

826 bytes read
Loaded environment from uEnv.txt
Importing environment from mmc ...
Running uenvcmd ...
reading uImage

3147916 bytes read
Booting from mmc (uEnv.txt configuration) ...
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-2.6.32
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3147852 Bytes = 3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing
Linux............................................................................................................................................................................................................
done, booting the kernel.

******Console End
***************************

uEnv.txt
********uEnv.txt start
*************************
usbethaddr=00:E0:4C:53:44:58
ethaddr=00:E0:4C:53:44:58
autoload=no
hostname=BBxM
serverip=192.168.0.41
ipaddr=192.168.0.141
netmask=255.255.255.0
getway=192.168.0.1
*console=ttyO2,115200n8             *-- had chanhed this to ttyO0 and ttyS2
too...! Everything else appears to be ok.
mpurate=auto
buddy=none
vram=12M
dvimode=640x480MR-16@60
defaultdisplay=dvi
loadaddr=0x80200000
mmcroot=/dev/mmcblk0p2 rw
mmcrootfstype=ext3 rootwait
ip=192.168.0.141:192.168.0.41:192.168.0.1:255.255.255.0:BBxM:eth0:off
mmcargs=setenv bootargs console=${console} ${optargs} mpurate=${mpurate}
buddy=${buddy} camera=${camera} vram=${vram} omapfb.mode=dvi:${dvimode}
omapdss.def_disp=${defaultdisplay} root=${mmcroot}
rootfstype=${mmcrootfstype} ip=${ip}
mmcboot=echo Booting from mmc (uEnv.txt configuration) ...; run mmcargs;
bootm ${loadaddr}
loaduimagefat=fatload mmc ${mmcdev} ${loadaddr} uImage
uenvcmd=run loaduimagefat; run mmcboot
********uEnv.txt end
*************************


How can I proceed..?

Meanwhile i will try the dumping the uboot memory as printed by the grep
printk_buf System.map as told by the Christopher Pow.

Thanks so much for looking into this..!!! :) :)

---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------


On Mon, Jul 8, 2013 at 11:28 PM, Robert Nelson <robertcnelson@gmail.com>wrote:

> On Fri, Jul 5, 2013 at 11:16 PM, Sudhangathan B S
> <sudhangathan@gmail.com> wrote:
> > On my way to integrate Leopard imaging camera drivers into the beagle
> board
> > image, I successfully built a minimal image with necessary camera
> drivers in
> > the image, this is all after I integrated meta-ti layer with yocto.
> > I finally put the files in the card and powered up the beagle board.
> >
> > This is what i'm getting..
> >
> > U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
> > Texas Instruments Revision detection unimplemented
> > OMAP SD/MMC: 0
> > reading u-boot.img
> > reading u-boot.img
> >
> >
> > U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
> >
> > OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
> > OMAP3 Beagle board + LPDDR/NAND
> > I2C:   ready
> > DRAM:  512 MiB
> > WARNING: Caches not enabled
> > NAND:  0 MiB
> > MMC:   OMAP SD/MMC: 0
> > *** Warning - readenv() failed, using default environment
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Beagle xM Rev C
> > No EEPROM on expansion board
> > No EEPROM on expansion board
> > Die ID #689000029ff80000016842c81202f014
> > Net:   Net Initialization Skipped
> > No ethernet found.
> > Hit any key to stop autoboot:  0
> > The user button is currently NOT pressed.
> > SD/MMC found on device 0
> > reading uEnv.txt
> >
> > ** Unable to read "uEnv.txt" from mmc 0:1 **
> > Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
> > 3148568 bytes read
> > Booting from mmc ...
> > ## Booting kernel from Legacy Image at 80200000 ...
> >    Image Name:   Linux-2.6.32
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    3148504 Bytes = 3 MiB
> >    Load Address: 80008000
> >    Entry Point:  80008000
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ... OK
> > OK
> >
> > Starting kernel ...
> >
> > Uncompressing
> >
> Linux............................................................................................................................................................................................................
> > done, booting the kernel.
> >
> > AND NOTHING AFTER THIS... Any clue how to proceed..?
>
> Back in the 2.6.32 days, the "omap" serial driver did not exist.. So
> if your still setting up console as /dev/ttyO2 change it to
> /dev/ttyS2..
>
> Regards,
>
> --
> Robert Nelson
> http://www.rcn-ee.com/
>

--047d7b5da46fe2751b04e10ada30
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I tried ttyO0 and ttyS2.. for some reason both did not wor=
k.. I am getting the same output, i.e. it freezes after &quot;...... done b=
ooting the kernel&quot;<div><br></div><div style>I made these changes throu=
gh the file uEnv.txt, and therefore the error=A0<span style=3D"color:rgb(80=
,0,80);font-family:arial,sans-serif;font-size:13px">** Unable to read &quot=
;uEnv.txt&quot; from mmc 0:1 ** </span><span style=3D"font-family:arial,san=
s-serif;font-size:13px"><font color=3D"#000000">doesn&#39;t come anymore..!=
</font></span></div>

<div style><span style=3D"font-family:arial,sans-serif;font-size:13px"><fon=
t color=3D"#000000"><br></font></span></div><div style><font color=3D"#0000=
00" face=3D"arial, sans-serif">I was also reading=A0<a href=3D"http://proce=
ssors.wiki.ti.com/index.php/Kernel_-_Common_Problems_Booting_Linux">http://=
processors.wiki.ti.com/index.php/Kernel_-_Common_Problems_Booting_Linux</a>=
 and also enabled &quot;</font>CONFIG_DEBUG_LL<span style=3D"color:rgb(0,0,=
0);font-family:arial,sans-serif">&quot; in the config file using the bitbak=
e -c menuconfig virtual/kernel command, but that did not take much affect.<=
/span></div>

<div style><span style=3D"color:rgb(0,0,0);font-family:arial,sans-serif"><b=
r></span></div><div style><span style=3D"color:rgb(0,0,0);font-family:arial=
,sans-serif">I have pasted below the console output and the uEnv.txt</span>=
</div>

<div style><span style=3D"color:rgb(0,0,0);font-family:arial,sans-serif"><b=
r></span></div><div style><span style=3D"color:rgb(0,0,0);font-family:arial=
,sans-serif">******Console Start**********************</span></div><div sty=
le>

<span style=3D"color:rgb(0,0,0);font-family:arial,sans-serif">*************=
*******************************</span></div><div style><div><font color=3D"=
#000000" face=3D"arial, sans-serif">U-Boot SPL 2011.09-01172-gfdbe8b9-dirty=
 (Jul 05 2013 - 20:38:26)</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Texas Instruments R=
evision detection unimplemented</font></div><div><font color=3D"#000000" fa=
ce=3D"arial, sans-serif">OMAP SD/MMC: 0</font></div><div><font color=3D"#00=
0000" face=3D"arial, sans-serif">reading u-boot.img</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">reading u-boot.img<=
/font></div><div><font color=3D"#000000" face=3D"arial, sans-serif"><br></f=
ont></div><div><font color=3D"#000000" face=3D"arial, sans-serif"><br></fon=
t></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">U-Boot 2011.09-0117=
2-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)</font></div><div><font color=3D"#=
000000" face=3D"arial, sans-serif"><br></font></div><div><font color=3D"#00=
0000" face=3D"arial, sans-serif">OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MH=
z, Max CPU Clock 1 Ghz</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">OMAP3 Beagle board =
+ LPDDR/NAND</font></div><div><font color=3D"#000000" face=3D"arial, sans-s=
erif">I2C: =A0 ready</font></div><div><font color=3D"#000000" face=3D"arial=
, sans-serif">DRAM: =A0512 MiB</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">WARNING: Caches not=
 enabled</font></div><div><font color=3D"#000000" face=3D"arial, sans-serif=
">NAND: =A00 MiB</font></div><div><font color=3D"#000000" face=3D"arial, sa=
ns-serif">MMC: =A0 OMAP SD/MMC: 0</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">*** Warning - reade=
nv() failed, using default environment</font></div><div><font color=3D"#000=
000" face=3D"arial, sans-serif"><br></font></div><div><font color=3D"#00000=
0" face=3D"arial, sans-serif">In: =A0 =A0serial</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Out: =A0 serial</fo=
nt></div><div><font color=3D"#000000" face=3D"arial, sans-serif">Err: =A0 s=
erial</font></div><div><font color=3D"#000000" face=3D"arial, sans-serif">B=
eagle xM Rev C</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">No EEPROM on expans=
ion board</font></div><div><font color=3D"#000000" face=3D"arial, sans-seri=
f">I2C read: I/O error</font></div><div><font color=3D"#000000" face=3D"ari=
al, sans-serif">Unrecognized expansion board: 0</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Die ID #689000029ff=
80000016842c81202f014</font></div><div><font color=3D"#000000" face=3D"aria=
l, sans-serif">Net: =A0 Net Initialization Skipped</font></div><div><font c=
olor=3D"#000000" face=3D"arial, sans-serif">No ethernet found.</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Hit any key to stop=
 autoboot: =A00=A0</font></div><div><font color=3D"#000000" face=3D"arial, =
sans-serif">The user button is currently NOT pressed.</font></div><div><fon=
t color=3D"#000000" face=3D"arial, sans-serif">SD/MMC found on device 0</fo=
nt></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">reading uEnv.txt</f=
ont></div><div><font color=3D"#000000" face=3D"arial, sans-serif"><br></fon=
t></div><div><font color=3D"#000000" face=3D"arial, sans-serif">826 bytes r=
ead</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Loaded environment =
from uEnv.txt</font></div><div><font color=3D"#000000" face=3D"arial, sans-=
serif">Importing environment from mmc ...</font></div><div><font color=3D"#=
000000" face=3D"arial, sans-serif">Running uenvcmd ...</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">reading uImage</fon=
t></div><div><font color=3D"#000000" face=3D"arial, sans-serif"><br></font>=
</div><div><font color=3D"#000000" face=3D"arial, sans-serif">3147916 bytes=
 read</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Booting from mmc (u=
Env.txt configuration) ...</font></div><div><font color=3D"#000000" face=3D=
"arial, sans-serif">## Booting kernel from Legacy Image at 80200000 ...</fo=
nt></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">=A0 =A0Image Name: =
=A0 Linux-2.6.32</font></div><div><font color=3D"#000000" face=3D"arial, sa=
ns-serif">=A0 =A0Image Type: =A0 ARM Linux Kernel Image (uncompressed)</fon=
t></div><div><font color=3D"#000000" face=3D"arial, sans-serif">=A0 =A0Data=
 Size: =A0 =A03147852 Bytes =3D 3 MiB</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">=A0 =A0Load Address=
: 80008000</font></div><div><font color=3D"#000000" face=3D"arial, sans-ser=
if">=A0 =A0Entry Point: =A080008000</font></div><div><font color=3D"#000000=
" face=3D"arial, sans-serif">=A0 =A0Verifying Checksum ... OK</font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">=A0 =A0Loading Kern=
el Image ... OK</font></div><div><font color=3D"#000000" face=3D"arial, san=
s-serif">OK</font></div><div><font color=3D"#000000" face=3D"arial, sans-se=
rif"><br></font></div>

<div><font color=3D"#000000" face=3D"arial, sans-serif">Starting kernel ...=
</font></div><div><font color=3D"#000000" face=3D"arial, sans-serif"><br></=
font></div><div><font color=3D"#000000" face=3D"arial, sans-serif">Uncompre=
ssing Linux................................................................=
...........................................................................=
................................................................. done, boo=
ting the kernel.</font></div>

<div style=3D"color:rgb(0,0,0);font-family:arial,sans-serif"><br></div></di=
v><div style><span style=3D"color:rgb(0,0,0);font-family:arial,sans-serif">=
******Console End</span></div><div style><span style=3D"color:rgb(0,0,0);fo=
nt-family:arial,sans-serif">***************************</span></div>

<div style><span style=3D"color:rgb(0,0,0);font-family:arial,sans-serif"><b=
r></span></div><div style><font color=3D"#000000" face=3D"arial, sans-serif=
">uEnv.txt</font></div><div style><font color=3D"#000000" face=3D"arial, sa=
ns-serif">********uEnv.txt start</font></div>

<div style><font color=3D"#000000" face=3D"arial, sans-serif">*************=
************</font></div><div style><div style=3D"font-family:Helvetica,Ari=
al,Verdana,sans-serif;font-size:13px;font-style:italic;line-height:16px"><f=
ont face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000">=
usbethaddr=3D00:E0:4C:53:44:58</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">ethaddr=3D00:E0:4C:53:44:58</font></=
div><div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:=
13px;font-style:italic;line-height:16px">

<font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000=
">autoload=3Dno</font></div><div style=3D"font-family:Helvetica,Arial,Verda=
na,sans-serif;font-size:13px;font-style:italic;line-height:16px"><font face=
=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000">hostname=
=3DBBxM</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">serverip=3D192.168.0.41</font></div>=
<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px">

<font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000=
">ipaddr=3D192.168.0.141</font></div><div style=3D"font-family:Helvetica,Ar=
ial,Verdana,sans-serif;font-size:13px;font-style:italic;line-height:16px"><=
font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000"=
>netmask=3D255.255.255.0</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">getway=3D192.168.0.1</font></div><di=
v style=3D"font-size:13px;line-height:16px">

<font size=3D"1" color=3D"#000000"><i style=3D"font-family:Helvetica,Arial,=
Verdana,sans-serif">console=3DttyO2,115200n8 =A0 =A0 =A0 =A0 =A0 =A0 </i><f=
ont face=3D"arial, helvetica, sans-serif">-- had chanhed this to ttyO0 and =
ttyS2 too...! Everything else appears to be ok.</font></font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">mpurate=3Dauto</font></div><div styl=
e=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px;font-sty=
le:italic;line-height:16px">

<font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000=
">buddy=3Dnone</font></div><div style=3D"font-family:Helvetica,Arial,Verdan=
a,sans-serif;font-size:13px;font-style:italic;line-height:16px"><font face=
=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000">vram=3D1=
2M</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">dvimode=3D640x480MR-16@60</font></di=
v><div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13=
px;font-style:italic;line-height:16px">

<font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000=
">defaultdisplay=3Ddvi</font></div><div style=3D"font-family:Helvetica,Aria=
l,Verdana,sans-serif;font-size:13px;font-style:italic;line-height:16px"><fo=
nt face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000">l=
oadaddr=3D0x80200000</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">mmcroot=3D/dev/mmcblk0p2 rw</font></=
div><div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:=
13px;font-style:italic;line-height:16px">

<font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000=
">mmcrootfstype=3Dext3 rootwait</font></div><div style=3D"font-family:Helve=
tica,Arial,Verdana,sans-serif;font-size:13px;font-style:italic;line-height:=
16px">

<font face=3D"&#39;courier new&#39;, monospace" size=3D"1" color=3D"#000000=
">ip=3D192.168.0.141:192.168.0.41:192.168.0.1:255.255.255.0:BBxM:eth0:off</=
font></div><div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;fon=
t-size:13px;font-style:italic;line-height:16px">

<font color=3D"#000000"><font face=3D"&#39;courier new&#39;, monospace" siz=
e=3D"1">mmcargs=3Dsetenv bootargs console=3D${console} ${optargs} mpurate=
=3D${mpurate} buddy=3D${buddy} camera=3D${camera} vram=3D${vram}=A0</font><=
span style=3D"font-family:&#39;courier new&#39;,monospace;font-size:x-small=
">omapfb.mode=3Ddvi:${dvimode} omapdss.def_disp=3D${defaultdisplay} root=3D=
${mmcroot} rootfstype=3D${mmcrootfstype} ip=3D${ip}</span></font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">mmcboot=3Decho Booting from mmc (uEn=
v.txt configuration) ...; run mmcargs; bootm ${loadaddr}</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">loaduimagefat=3Dfatload mmc ${mmcdev=
} ${loadaddr} uImage</font></div>

<div style=3D"font-family:Helvetica,Arial,Verdana,sans-serif;font-size:13px=
;font-style:italic;line-height:16px"><font face=3D"&#39;courier new&#39;, m=
onospace" size=3D"1" color=3D"#000000">uenvcmd=3Drun loaduimagefat; run mmc=
boot</font></div>

</div><div style><font color=3D"#000000" face=3D"arial, sans-serif">*******=
*uEnv.txt end</font></div><div style><font color=3D"#000000" face=3D"arial,=
 sans-serif">*************************</font></div><div style><font color=
=3D"#000000" face=3D"arial, sans-serif"><br>

</font></div><div style><font color=3D"#000000" face=3D"arial, sans-serif">=
<br></font></div><div style><font color=3D"#000000" face=3D"arial, sans-ser=
if">How can I proceed..?</font></div><div style><font color=3D"#000000" fac=
e=3D"arial, sans-serif"><br>

</font></div><div style><font color=3D"#000000" face=3D"arial, sans-serif">=
Meanwhile i will try the dumping the uboot=A0</font><span style=3D"font-fam=
ily:Calibri,sans-serif"><font color=3D"#000000">memory as printed by the=A0=
</font></span><span style=3D"color:rgb(31,73,125);font-family:Calibri,sans-=
serif;font-size:15px">grep printk_buf System.map</span><span style=3D"font-=
family:Calibri,sans-serif"><font color=3D"#000000">=A0as told by the Christ=
opher Pow.</font></span></div>

<div style><span style=3D"font-family:Calibri,sans-serif"><font color=3D"#0=
00000"><br></font></span></div><div style><span style=3D"font-family:Calibr=
i,sans-serif"><font color=3D"#000000">Thanks so much for looking into this.=
.!!! :) :)</font></span></div>

</div><div class=3D"gmail_extra"><br clear=3D"all"><div>-------------------=
--------------<br>Sudhangathan BS<br>Ph:(+91) 9731-905-205<br>-------------=
--------------------</div>
<br><br><div class=3D"gmail_quote">On Mon, Jul 8, 2013 at 11:28 PM, Robert =
Nelson <span dir=3D"ltr">&lt;<a href=3D"mailto:robertcnelson@gmail.com" tar=
get=3D"_blank">robertcnelson@gmail.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Fri, Jul 5, 2013 at 11:16 PM, Su=
dhangathan B S<br>
&lt;<a href=3D"mailto:sudhangathan@gmail.com">sudhangathan@gmail.com</a>&gt=
; wrote:<br>
&gt; On my way to integrate Leopard imaging camera drivers into the beagle =
board<br>
&gt; image, I successfully built a minimal image with necessary camera driv=
ers in<br>
&gt; the image, this is all after I integrated meta-ti layer with yocto.<br=
>
&gt; I finally put the files in the card and powered up the beagle board.<b=
r>
&gt;<br>
&gt; This is what i&#39;m getting..<br>
&gt;<br>
&gt; U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)<br>
&gt; Texas Instruments Revision detection unimplemented<br>
&gt; OMAP SD/MMC: 0<br>
&gt; reading u-boot.img<br>
&gt; reading u-boot.img<br>
&gt;<br>
&gt;<br>
&gt; U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)<br>
&gt;<br>
&gt; OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz<br>
&gt; OMAP3 Beagle board + LPDDR/NAND<br>
&gt; I2C: =A0 ready<br>
&gt; DRAM: =A0512 MiB<br>
&gt; WARNING: Caches not enabled<br>
&gt; NAND: =A00 MiB<br>
&gt; MMC: =A0 OMAP SD/MMC: 0<br>
&gt; *** Warning - readenv() failed, using default environment<br>
&gt;<br>
&gt; In: =A0 =A0serial<br>
&gt; Out: =A0 serial<br>
&gt; Err: =A0 serial<br>
&gt; Beagle xM Rev C<br>
&gt; No EEPROM on expansion board<br>
&gt; No EEPROM on expansion board<br>
&gt; Die ID #689000029ff80000016842c81202f014<br>
&gt; Net: =A0 Net Initialization Skipped<br>
&gt; No ethernet found.<br>
&gt; Hit any key to stop autoboot: =A00<br>
&gt; The user button is currently NOT pressed.<br>
&gt; SD/MMC found on device 0<br>
&gt; reading uEnv.txt<br>
&gt;<br>
&gt; ** Unable to read &quot;uEnv.txt&quot; from mmc 0:1 **<br>
&gt; Loading file &quot;/boot/uImage&quot; from mmc device 0:2 (xxa2)<br>
&gt; 3148568 bytes read<br>
&gt; Booting from mmc ...<br>
&gt; ## Booting kernel from Legacy Image at 80200000 ...<br>
&gt; =A0 =A0Image Name: =A0 Linux-2.6.32<br>
&gt; =A0 =A0Image Type: =A0 ARM Linux Kernel Image (uncompressed)<br>
&gt; =A0 =A0Data Size: =A0 =A03148504 Bytes =3D 3 MiB<br>
&gt; =A0 =A0Load Address: 80008000<br>
&gt; =A0 =A0Entry Point: =A080008000<br>
&gt; =A0 =A0Verifying Checksum ... OK<br>
&gt; =A0 =A0Loading Kernel Image ... OK<br>
&gt; OK<br>
&gt;<br>
&gt; Starting kernel ...<br>
&gt;<br>
&gt; Uncompressing<br>
&gt; Linux.................................................................=
...........................................................................=
................................................................<br>
&gt; done, booting the kernel.<br>
&gt;<br>
&gt; AND NOTHING AFTER THIS... Any clue how to proceed..?<br>
<br>
</div></div>Back in the 2.6.32 days, the &quot;omap&quot; serial driver did=
 not exist.. So<br>
if your still setting up console as /dev/ttyO2 change it to<br>
/dev/ttyS2..<br>
<br>
Regards,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Robert Nelson<br>
<a href=3D"http://www.rcn-ee.com/" target=3D"_blank">http://www.rcn-ee.com/=
</a><br>
</font></span></blockquote></div><br></div>

--047d7b5da46fe2751b04e10ada30--
