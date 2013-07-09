Return-Path: <will.frazer@eurotech.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 531D6E005B3
	for <meta-ti@yoctoproject.org>; Tue,  9 Jul 2013 07:56:16 -0700 (PDT)
Received: from mail12-co9-R.bigfish.com (10.236.132.240) by
	CO9EHSOBE023.bigfish.com (10.236.130.86) with Microsoft SMTP Server id
	14.1.225.22; Tue, 9 Jul 2013 14:56:15 +0000
Received: from mail12-co9 (localhost [127.0.0.1])	by mail12-co9-R.bigfish.com
	(Postfix) with ESMTP id 925773202F2;
	Tue,  9 Jul 2013 14:56:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:157.56.248.53; KIP:(null); UIP:(null); IPV:NLI;
	H:AMSPRD0510HT004.eurprd05.prod.outlook.com; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: PS-2(z21eIz98dI9371Ic85fh1432Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1d7338h17326ah18c673h19a27bh8275bh8275dhz2dh2a8h668h839hd24hf0ah1288h12a5h12bdh137ah1441h1504h1537h153bh162dh1631h1758h18e1h1946h19b5h19ceh1ad9h1b0ah1bceh1d07h1d0ch1d2eh1d3fh1de9h1dfeh1dffh1e1dh9a9j1155h)
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(5423002)(51704005)(24454002)(189002)(199002)(377454003)(74316001)(81542001)(56776001)(74366001)(46102001)(77096001)(76796001)(51856001)(31966008)(50986001)(47446002)(47736001)(83072001)(19300405004)(33646001)(16406001)(74662001)(56816003)(76482001)(59766001)(16236675002)(74502001)(54356001)(65816001)(47976001)(16799955002)(77982001)(79102001)(63696002)(66066001)(53806001)(76786001)(15202345003)(4396001)(76576001)(49866001)(80022001)(74706001)(69226001)(81342001)(54316002)(74876001)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:AMSPR05MB083;
	H:AMSPR05MB083.eurprd05.prod.outlook.com; RD:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received: from mail12-co9 (localhost.localdomain [127.0.0.1]) by mail12-co9
	(MessageSwitch) id 1373381772995778_9984;
	Tue,  9 Jul 2013 14:56:12 +0000 (UTC)
Received: from CO9EHSMHS009.bigfish.com (unknown [10.236.132.239])	by
	mail12-co9.bigfish.com (Postfix) with ESMTP id E8D5C3C004E;
	Tue,  9 Jul 2013 14:56:12 +0000 (UTC)
Received: from AMSPRD0510HT004.eurprd05.prod.outlook.com (157.56.248.53) by
	CO9EHSMHS009.bigfish.com (10.236.130.19) with Microsoft SMTP Server
	(TLS) id 14.1.225.23; Tue, 9 Jul 2013 14:56:12 +0000
Received: from AMSPR05MB083.eurprd05.prod.outlook.com (10.242.89.149) by
	AMSPRD0510HT004.eurprd05.prod.outlook.com (10.255.42.39) with Microsoft
	SMTP Server (TLS) id 14.16.329.3; Tue, 9 Jul 2013 14:55:46 +0000
Received: from AMSPR05MB083.eurprd05.prod.outlook.com (10.242.89.149) by
	AMSPR05MB083.eurprd05.prod.outlook.com (10.242.89.149) with Microsoft
	SMTP Server (TLS) id 15.0.702.21; Tue, 9 Jul 2013 14:55:45 +0000
Received: from AMSPR05MB083.eurprd05.prod.outlook.com ([169.254.10.138]) by
	AMSPR05MB083.eurprd05.prod.outlook.com ([169.254.10.138]) with mapi id
	15.00.0702.005; Tue, 9 Jul 2013 14:55:44 +0000
From: "Frazer, Will" <will.frazer@eurotech.com>
To: Sudhangathan B S <sudhangathan@gmail.com>, "christopher.pow@honeywell.com"
	<christopher.pow@honeywell.com>, "robertcnelson@gmail.com"
	<robertcnelson@gmail.com>
Thread-Topic: [meta-ti] booting 2.6.32 kernel and rootfs
Thread-Index: AQHOfATn23nlUu+KD0+ORuG2+/KDpZlbnqEAgADPNaA=
Date: Tue, 9 Jul 2013 14:55:43 +0000
Message-ID: <f9b836e687c7471eac9badd93315ecc8@AMSPR05MB083.eurprd05.prod.outlook.com>
References: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
	<CAOCHtYgPdfsXQnmCMT0t1hETrtocmV=AEpXdH_gd6ukw-70_sg@mail.gmail.com>
	<CAGX3a98VeXEX9DsU684t1d=_EpvSdftZVd=SuaHCKdpxSH+RNg@mail.gmail.com>
In-Reply-To: <CAGX3a98VeXEX9DsU684t1d=_EpvSdftZVd=SuaHCKdpxSH+RNg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [164.40.222.34]
x-forefront-prvs: 0902222726
MIME-Version: 1.0
X-OriginatorOrg: eurotech.com
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
X-List-Received-Date: Tue, 09 Jul 2013 14:56:17 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f9b836e687c7471eac9badd93315ecc8AMSPR05MB083eurprd05pro_"

--_000_f9b836e687c7471eac9badd93315ecc8AMSPR05MB083eurprd05pro_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's still likely that the console is not right. Personally I'd try a few o=
ther device nodes. As Robert mentioned, it's probably not using the /dev/tt=
yO? nodes because of the kernel version, so ttyS0 onwards would be what I w=
ould be looking at first.

Another possibility is to network boot Linux (i.e. TFTP the kernel then use=
 NFS for the rootfs) then try to figure it out from that end. At least you =
may be able to see the serial port device nodes and work backwards.

Worse case try cross reference the serial port addresses on your hardware a=
gainst what is being setup by UBoot & the kernel.

regards,
Will

Will Frazer | EUROTECH


From: Sudhangathan B S [mailto:sudhangathan@gmail.com]
Sent: 09 July 2013 03:24
To: Frazer, Will; christopher.pow@honeywell.com; robertcnelson@gmail.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] booting 2.6.32 kernel and rootfs

I tried ttyO0 and ttyS2.. for some reason both did not work.. I am getting =
the same output, i.e. it freezes after "...... done booting the kernel"

I made these changes through the file uEnv.txt, and therefore the error ** =
Unable to read "uEnv.txt" from mmc 0:1 ** doesn't come anymore..!

I was also reading http://processors.wiki.ti.com/index.php/Kernel_-_Common_=
Problems_Booting_Linux and also enabled "CONFIG_DEBUG_LL" in the config fil=
e using the bitbake -c menuconfig virtual/kernel command, but that did not =
take much affect.

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
   Data Size:    3147852 Bytes =3D 3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux........................................................=
...........................................................................=
......................................................................... d=
one, booting the kernel.

******Console End
***************************

uEnv.txt
********uEnv.txt start
*************************
usbethaddr=3D00:E0:4C:53:44:58
ethaddr=3D00:E0:4C:53:44:58
autoload=3Dno
hostname=3DBBxM
serverip=3D192.168.0.41
ipaddr=3D192.168.0.141
netmask=3D255.255.255.0
getway=3D192.168.0.1
console=3DttyO2,115200n8             -- had chanhed this to ttyO0 and ttyS2=
 too...! Everything else appears to be ok.
mpurate=3Dauto
buddy=3Dnone
vram=3D12M
dvimode=3D640x480MR-16@60
defaultdisplay=3Ddvi
loadaddr=3D0x80200000
mmcroot=3D/dev/mmcblk0p2 rw
mmcrootfstype=3Dext3 rootwait
ip=3D192.168.0.141:192.168.0.41:192.168.0.1:255.255.255.0:BBxM:eth0:off
mmcargs=3Dsetenv bootargs console=3D${console} ${optargs} mpurate=3D${mpura=
te} buddy=3D${buddy} camera=3D${camera} vram=3D${vram} omapfb.mode=3Ddvi:${=
dvimode} omapdss.def_disp=3D${defaultdisplay} root=3D${mmcroot} rootfstype=
=3D${mmcrootfstype} ip=3D${ip}
mmcboot=3Decho Booting from mmc (uEnv.txt configuration) ...; run mmcargs; =
bootm ${loadaddr}
loaduimagefat=3Dfatload mmc ${mmcdev} ${loadaddr} uImage
uenvcmd=3Drun loaduimagefat; run mmcboot
********uEnv.txt end
*************************


How can I proceed..?

Meanwhile i will try the dumping the uboot memory as printed by the grep pr=
intk_buf System.map as told by the Christopher Pow.

Thanks so much for looking into this..!!! :) :)

---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------

On Mon, Jul 8, 2013 at 11:28 PM, Robert Nelson <robertcnelson@gmail.com<mai=
lto:robertcnelson@gmail.com>> wrote:
On Fri, Jul 5, 2013 at 11:16 PM, Sudhangathan B S
<sudhangathan@gmail.com<mailto:sudhangathan@gmail.com>> wrote:
> On my way to integrate Leopard imaging camera drivers into the beagle boa=
rd
> image, I successfully built a minimal image with necessary camera drivers=
 in
> the image, this is all after I integrated meta-ti layer with yocto.
> I finally put the files in the card and powered up the beagle board.
>
> This is what i'm getting..
>
> U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
> Texas Instruments Revision detection unimplemented
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
>
> OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
> OMAP3 Beagle board + LPDDR/NAND
> I2C:   ready
> DRAM:  512 MiB
> WARNING: Caches not enabled
> NAND:  0 MiB
> MMC:   OMAP SD/MMC: 0
> *** Warning - readenv() failed, using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Beagle xM Rev C
> No EEPROM on expansion board
> No EEPROM on expansion board
> Die ID #689000029ff80000016842c81202f014
> Net:   Net Initialization Skipped
> No ethernet found.
> Hit any key to stop autoboot:  0
> The user button is currently NOT pressed.
> SD/MMC found on device 0
> reading uEnv.txt
>
> ** Unable to read "uEnv.txt" from mmc 0:1 **
> Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
> 3148568 bytes read
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 80200000 ...
>    Image Name:   Linux-2.6.32
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    3148504 Bytes =3D 3 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Uncompressing
> Linux....................................................................=
...........................................................................=
.............................................................
> done, booting the kernel.
>
> AND NOTHING AFTER THIS... Any clue how to proceed..?
Back in the 2.6.32 days, the "omap" serial driver did not exist.. So
if your still setting up console as /dev/ttyO2 change it to
/dev/ttyS2..

Regards,

--
Robert Nelson
http://www.rcn-ee.com/


--_000_f9b836e687c7471eac9badd93315ecc8AMSPR05MB083eurprd05pro_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">It&#8217;s still likely t=
hat the console is not right. Personally I&#8217;d try a few other device n=
odes. As Robert mentioned, it&#8217;s probably not using the /dev/ttyO? nod=
es
 because of the kernel version, so ttyS0 onwards would be what I would be l=
ooking at first.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Another possibility is to=
 network boot Linux (i.e. TFTP the kernel then use NFS for the rootfs) then=
 try to figure it out from that end. At least you may be
 able to see the serial port device nodes and work backwards.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Worse case try cross refe=
rence the serial port addresses on your hardware against what is being setu=
p by UBoot &amp; the kernel.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">regards,<br>
Will&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Will Frazer | EUROTECH
<br>
<br>
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;;color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span =
lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&qu=
ot;sans-serif&quot;"> Sudhangathan B S [mailto:sudhangathan@gmail.com]
<br>
<b>Sent:</b> 09 July 2013 03:24<br>
<b>To:</b> Frazer, Will; christopher.pow@honeywell.com; robertcnelson@gmail=
.com<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] booting 2.6.32 kernel and rootfs<o:p></o:p></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">I tried ttyO0 and ttyS2.. for some reason both did n=
ot work.. I am getting the same output, i.e. it freezes after &quot;...... =
done booting the kernel&quot;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I made these changes through the file uEnv.txt, and =
therefore the error&nbsp;<span style=3D"font-size:10.0pt;font-family:&quot;=
Arial&quot;,&quot;sans-serif&quot;;color:#500050">** Unable to read &quot;u=
Env.txt&quot; from mmc 0:1 **
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:black">doesn't come anymore..!</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">I was also reading&nbsp;<a href=3D"http://proc=
essors.wiki.ti.com/index.php/Kernel_-_Common_Problems_Booting_Linux">http:/=
/processors.wiki.ti.com/index.php/Kernel_-_Common_Problems_Booting_Linux</a=
>
 and also enabled &quot;</span>CONFIG_DEBUG_LL<span style=3D"font-family:&q=
uot;Arial&quot;,&quot;sans-serif&quot;;color:black">&quot; in the config fi=
le using the bitbake -c menuconfig virtual/kernel command, but that did not=
 take much affect.</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">I have pasted below the console output and the=
 uEnv.txt</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">******Console Start**********************</spa=
n><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">********************************************</=
span><o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 0=
5 2013 - 20:38:26)</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Texas Instruments Revision detection unimpleme=
nted</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">OMAP SD/MMC: 0</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">reading u-boot.img</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">reading u-boot.img</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 20=
13 - 20:38:26)</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, M=
ax CPU Clock 1 Ghz</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">OMAP3 Beagle board &#43; LPDDR/NAND</span><o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">I2C: &nbsp; ready</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">DRAM: &nbsp;512 MiB</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">WARNING: Caches not enabled</span><o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">NAND: &nbsp;0 MiB</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">MMC: &nbsp; OMAP SD/MMC: 0</span><o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">*** Warning - readenv() failed, using default =
environment</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">In: &nbsp; &nbsp;serial</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Out: &nbsp; serial</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Err: &nbsp; serial</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Beagle xM Rev C</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">No EEPROM on expansion board</span><o:p></o:p>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">I2C read: I/O error</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Unrecognized expansion board: 0</span><o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Die ID #689000029ff80000016842c81202f014</span=
><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Net: &nbsp; Net Initialization Skipped</span><=
o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">No ethernet found.</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Hit any key to stop autoboot: &nbsp;0&nbsp;</s=
pan><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">The user button is currently NOT pressed.</spa=
n><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">SD/MMC found on device 0</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">reading uEnv.txt</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">826 bytes read</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Loaded environment from uEnv.txt</span><o:p></=
o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Importing environment from mmc ...</span><o:p>=
</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Running uenvcmd ...</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">reading uImage</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">3147916 bytes read</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Booting from mmc (uEnv.txt configuration) ...<=
/span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">## Booting kernel from Legacy Image at 8020000=
0 ...</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Image Name: &nbsp; Linux-2.6.32</=
span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Image Type: &nbsp; ARM Linux Kern=
el Image (uncompressed)</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Data Size: &nbsp; &nbsp;3147852 B=
ytes =3D 3 MiB</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Load Address: 80008000</span><o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Entry Point: &nbsp;80008000</span=
><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Verifying Checksum ... OK</span><=
o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp; &nbsp;Loading Kernel Image ... OK</span=
><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">OK</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Starting kernel ...</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Uncompressing Linux...........................=
...........................................................................=
...........................................................................=
...........................
 done, booting the kernel.</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">******Console End</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">***************************</span><o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">uEnv.txt</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">********uEnv.txt start</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">*************************</span><o:p></o:p></p=
>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">usbethaddr=3D00=
:E0:4C:53:44:58</span></i><i><span style=3D"font-size:10.0pt;font-family:&q=
uot;Helvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">ethaddr=3D00:E0=
:4C:53:44:58</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot=
;Helvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">autoload=3Dno</=
span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvetica&quo=
t;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">hostname=3DBBxM=
</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvetica&q=
uot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">serverip=3D192.=
168.0.41</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Hel=
vetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">ipaddr=3D192.16=
8.0.141</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helv=
etica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">netmask=3D255.2=
55.255.0</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Hel=
vetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">getway=3D192.16=
8.0.1</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvet=
ica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Helvetica&quot;,&quot;sans-serif&quot;;color:b=
lack">console=3DttyO2,115200n8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></i><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,&qu=
ot;sans-serif&quot;;color:black">-- had chanhed this to ttyO0 and ttyS2 too=
...! Everything else appears to be ok.</span><span style=3D"font-size:10.0p=
t"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">mpurate=3Dauto<=
/span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvetica&qu=
ot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">buddy=3Dnone</s=
pan></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvetica&quot=
;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">vram=3D12M</spa=
n></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvetica&quot;,=
&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">dvimode=3D640x4=
80MR-16@60</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;H=
elvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">defaultdisplay=
=3Ddvi</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helve=
tica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">loadaddr=3D0x80=
200000</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helve=
tica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">mmcroot=3D/dev/=
mmcblk0p2 rw</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot=
;Helvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">mmcrootfstype=
=3Dext3 rootwait</span></i><i><span style=3D"font-size:10.0pt;font-family:&=
quot;Helvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">ip=3D192.168.0.=
141:192.168.0.41:192.168.0.1:255.255.255.0:BBxM:eth0:off</span></i><i><span=
 style=3D"font-size:10.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-ser=
if&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">mmcargs=3Dseten=
v bootargs console=3D${console} ${optargs} mpurate=3D${mpurate} buddy=3D${b=
uddy} camera=3D${camera} vram=3D${vram}&nbsp;</span></i><i><span style=3D"f=
ont-size:10.0pt;font-family:&quot;Courier New&quot;;color:black">omapfb.mod=
e=3Ddvi:${dvimode}
 omapdss.def_disp=3D${defaultdisplay} root=3D${mmcroot} rootfstype=3D${mmcr=
ootfstype} ip=3D${ip}</span></i><i><span style=3D"font-size:10.0pt;font-fam=
ily:&quot;Helvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p=
>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">mmcboot=3Decho =
Booting from mmc (uEnv.txt configuration) ...; run mmcargs; bootm ${loadadd=
r}</span></i><i><span style=3D"font-size:10.0pt;font-family:&quot;Helvetica=
&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">loaduimagefat=
=3Dfatload mmc ${mmcdev} ${loadaddr} uImage</span></i><i><span style=3D"fon=
t-size:10.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-serif&quot;"><o:=
p></o:p></span></i></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><i><span style=3D"font-=
size:7.5pt;font-family:&quot;Courier New&quot;;color:black">uenvcmd=3Drun l=
oaduimagefat; run mmcboot</span></i><i><span style=3D"font-size:10.0pt;font=
-family:&quot;Helvetica&quot;,&quot;sans-serif&quot;"><o:p></o:p></span></i=
></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">********uEnv.txt end</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">*************************</span><o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">How can I proceed..?</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Meanwhile i will try the dumping the uboot&nbs=
p;</span><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&qu=
ot;;color:black">memory as printed by the&nbsp;</span><span style=3D"font-s=
ize:11.5pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F=
497D">grep
 printk_buf System.map</span><span style=3D"font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:black">&nbsp;as told by the Christopher Pow.<=
/span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,&quot=
;sans-serif&quot;;color:black">Thanks so much for looking into this..!!! :)=
 :)</span><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">---------------------------------<br>
Sudhangathan BS<br>
Ph:(&#43;91) 9731-905-205<br>
---------------------------------<o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Mon, Jul 8, 2013 at 11:28 PM, Robert Nelson &lt;<=
a href=3D"mailto:robertcnelson@gmail.com" target=3D"_blank">robertcnelson@g=
mail.com</a>&gt; wrote:<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On Fri, Jul 5, 2013 a=
t 11:16 PM, Sudhangathan B S<br>
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
&gt; This is what i'm getting..<br>
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
&gt; OMAP3 Beagle board &#43; LPDDR/NAND<br>
&gt; I2C: &nbsp; ready<br>
&gt; DRAM: &nbsp;512 MiB<br>
&gt; WARNING: Caches not enabled<br>
&gt; NAND: &nbsp;0 MiB<br>
&gt; MMC: &nbsp; OMAP SD/MMC: 0<br>
&gt; *** Warning - readenv() failed, using default environment<br>
&gt;<br>
&gt; In: &nbsp; &nbsp;serial<br>
&gt; Out: &nbsp; serial<br>
&gt; Err: &nbsp; serial<br>
&gt; Beagle xM Rev C<br>
&gt; No EEPROM on expansion board<br>
&gt; No EEPROM on expansion board<br>
&gt; Die ID #689000029ff80000016842c81202f014<br>
&gt; Net: &nbsp; Net Initialization Skipped<br>
&gt; No ethernet found.<br>
&gt; Hit any key to stop autoboot: &nbsp;0<br>
&gt; The user button is currently NOT pressed.<br>
&gt; SD/MMC found on device 0<br>
&gt; reading uEnv.txt<br>
&gt;<br>
&gt; ** Unable to read &quot;uEnv.txt&quot; from mmc 0:1 **<br>
&gt; Loading file &quot;/boot/uImage&quot; from mmc device 0:2 (xxa2)<br>
&gt; 3148568 bytes read<br>
&gt; Booting from mmc ...<br>
&gt; ## Booting kernel from Legacy Image at 80200000 ...<br>
&gt; &nbsp; &nbsp;Image Name: &nbsp; Linux-2.6.32<br>
&gt; &nbsp; &nbsp;Image Type: &nbsp; ARM Linux Kernel Image (uncompressed)<=
br>
&gt; &nbsp; &nbsp;Data Size: &nbsp; &nbsp;3148504 Bytes =3D 3 MiB<br>
&gt; &nbsp; &nbsp;Load Address: 80008000<br>
&gt; &nbsp; &nbsp;Entry Point: &nbsp;80008000<br>
&gt; &nbsp; &nbsp;Verifying Checksum ... OK<br>
&gt; &nbsp; &nbsp;Loading Kernel Image ... OK<br>
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
&gt; AND NOTHING AFTER THIS... Any clue how to proceed..?<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">Back in the 2.6.32 days, the &quot;omap&quot; serial=
 driver did not exist.. So<br>
if your still setting up console as /dev/ttyO2 change it to<br>
/dev/ttyS2..<br>
<br>
Regards,<br>
<span style=3D"color:#888888"><br>
<span class=3D"hoenzb">--</span><br>
<span class=3D"hoenzb">Robert Nelson</span><br>
<span class=3D"hoenzb"><a href=3D"http://www.rcn-ee.com/" target=3D"_blank"=
>http://www.rcn-ee.com/</a></span></span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_f9b836e687c7471eac9badd93315ecc8AMSPR05MB083eurprd05pro_--
