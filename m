Return-Path: <will.frazer@eurotech.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe001.messaging.microsoft.com [216.32.180.184])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10E8EE013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 10:24:45 -0700 (PDT)
Received: from mail174-co1-R.bigfish.com (10.243.78.239) by
	CO1EHSOBE040.bigfish.com (10.243.66.105) with Microsoft SMTP Server id
	14.1.225.22; Mon, 8 Jul 2013 17:24:44 +0000
Received: from mail174-co1 (localhost [127.0.0.1])	by
	mail174-co1-R.bigfish.com (Postfix) with ESMTP id 92B021002DF	for
	<meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 17:24:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:157.56.248.53; KIP:(null); UIP:(null); IPV:NLI;
	H:AMSPRD0510HT001.eurprd05.prod.outlook.com; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: PS1(z21eIzc85fhzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1d7338h17326ah18c673h8275bh8275dhz2dh2a8h668h839hd24hf0ah1288h12a5h12bdh137ah1441h1504h1537h153bh162dh1631h1758h18e1h1946h19b5h19ceh1ad9h1b0ah1bceh1d07h1d0ch1d2eh1d3fh1de9h1dfeh1dffh1e1dh9a9j1155h)
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(199002)(5423002)(189002)(51856001)(77982001)(33646001)(76576001)(80022001)(16406001)(54356001)(63696002)(49866001)(81542001)(69226001)(74316001)(47446002)(47976001)(15202345003)(47736001)(74502001)(76482001)(74876001)(56776001)(16236675002)(53806001)(79102001)(74662001)(50986001)(4396001)(54316002)(31966008)(77096001)(81342001)(76786001)(76796001)(19300405004)(74366001)(46102001)(59766001)(66066001)(83072001)(74706001)(56816003)(65816001)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:AMXPR05MB087;
	H:AMXPR05MB085.eurprd05.prod.outlook.com; RD:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received: from mail174-co1 (localhost.localdomain [127.0.0.1]) by mail174-co1
	(MessageSwitch) id 1373304282519264_28775;
	Mon,  8 Jul 2013 17:24:42 +0000 (UTC)
Received: from CO1EHSMHS017.bigfish.com (unknown [10.243.78.233])	by
	mail174-co1.bigfish.com (Postfix) with ESMTP id 7CB935C00CA	for
	<meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 17:24:42 +0000 (UTC)
Received: from AMSPRD0510HT001.eurprd05.prod.outlook.com (157.56.248.53) by
	CO1EHSMHS017.bigfish.com (10.243.66.27) with Microsoft SMTP Server
	(TLS) id 14.1.225.23; Mon, 8 Jul 2013 17:24:42 +0000
Received: from AMXPR05MB087.eurprd05.prod.outlook.com (10.242.70.24) by
	AMSPRD0510HT001.eurprd05.prod.outlook.com (10.255.42.36) with Microsoft
	SMTP Server (TLS) id 14.16.329.3; Mon, 8 Jul 2013 17:24:26 +0000
Received: from AMXPR05MB085.eurprd05.prod.outlook.com (10.242.70.17) by
	AMXPR05MB087.eurprd05.prod.outlook.com (10.242.70.24) with Microsoft
	SMTP Server (TLS) id 15.0.702.21; Mon, 8 Jul 2013 17:24:25 +0000
Received: from AMXPR05MB085.eurprd05.prod.outlook.com ([169.254.8.165]) by
	AMXPR05MB085.eurprd05.prod.outlook.com ([169.254.8.165]) with mapi id
	15.00.0702.005; Mon, 8 Jul 2013 17:24:24 +0000
From: "Frazer, Will" <will.frazer@eurotech.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti]  booting 2.6.32 kernel and rootfs
Thread-Index: AQHOef+08U1Td/7tqUeS0p4q1LMjqZlbCF2g
Date: Mon, 8 Jul 2013 17:24:24 +0000
Message-ID: <68f4dfd4107847b8b02ec486eff4e492@AMXPR05MB085.eurprd05.prod.outlook.com>
References: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
In-Reply-To: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [164.40.222.34]
x-forefront-prvs: 09011458FC
MIME-Version: 1.0
X-OriginatorOrg: eurotech.com
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
X-List-Received-Date: Mon, 08 Jul 2013 17:24:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_68f4dfd4107847b8b02ec486eff4e492AMXPR05MB085eurprd05pro_"

--_000_68f4dfd4107847b8b02ec486eff4e492AMXPR05MB085eurprd05pro_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sounds like it is booting OK but the console is wrong.

Check into why you are getting this message also
** Unable to read "uEnv.txt" from mmc 0:1 **
as the kernel args ought to get read from there:

If they are not loaded then the defaults in the kernel will get used. You m=
ight want to check these also.
Not sure about your board/setup however try using /dev/ttyO0. You can test =
this from U-Boot also by altering the env vars

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Sudhangathan B S
Sent: 06 July 2013 05:16
To: meta-ti@yoctoproject.org
Subject: [meta-ti] booting 2.6.32 kernel and rootfs

On my way to integrate Leopard imaging camera drivers into the beagle board=
 image, I successfully built a minimal image with necessary camera drivers =
in the image, this is all after I integrated meta-ti layer with yocto.
I finally put the files in the card and powered up the beagle board.

This is what i'm getting..

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
No EEPROM on expansion board
Die ID #689000029ff80000016842c81202f014
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
The user button is currently NOT pressed.
SD/MMC found on device 0
reading uEnv.txt

** Unable to read "uEnv.txt" from mmc 0:1 **
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
3148568 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-2.6.32
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3148504 Bytes =3D 3 MiB
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

AND NOTHING AFTER THIS... Any clue how to proceed..?

I posted in this mailing list, just because i'm using the meta-ti layer. Pl=
ease do let me know if there is another one..!

Best,
---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------

--_000_68f4dfd4107847b8b02ec486eff4e492AMXPR05MB085eurprd05pro_
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
span.EmailStyle17
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Sounds like it is booting=
 OK but the console is wrong.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Check into why you are ge=
tting this message also
<o:p></o:p></span></p>
<p class=3D"MsoNormal">** Unable to read &quot;uEnv.txt&quot; from mmc 0:1 =
**<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">as the kernel args ought =
to get read from there:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">If they are not loaded th=
en the defaults in the kernel will get used. You might want to check these =
also.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Not sure about your board=
/setup however try using /dev/ttyO0. You can test this from U-Boot also by =
altering the env vars<o:p></o:p></span></p>
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
ot;sans-serif&quot;"> meta-ti-bounces@yoctoproject.org [mailto:meta-ti-boun=
ces@yoctoproject.org]
<b>On Behalf Of </b>Sudhangathan B S<br>
<b>Sent:</b> 06 July 2013 05:16<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> [meta-ti] booting 2.6.32 kernel and rootfs<o:p></o:p></span=
></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On my way to integrate Leopard imaging camera driver=
s into the beagle board image, I successfully built a minimal image with ne=
cessary camera drivers in the image, this is all after I integrated meta-ti=
 layer with yocto.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">I finally put the files in the card and powered up t=
he beagle board.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This is what i'm getting..<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013=
 - 20:38:26)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Texas Instruments Revision detection unimplemented<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">OMAP SD/MMC: 0<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">reading u-boot.img<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">reading u-boot.img<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 2=
0:38:26)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU=
 Clock 1 Ghz<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">OMAP3 Beagle board &#43; LPDDR/NAND<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I2C: &nbsp; ready<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">DRAM: &nbsp;512 MiB<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">WARNING: Caches not enabled<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">NAND: &nbsp;0 MiB<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">MMC: &nbsp; OMAP SD/MMC: 0<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">*** Warning - readenv() failed, using default enviro=
nment<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">In: &nbsp; &nbsp;serial<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Out: &nbsp; serial<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Err: &nbsp; serial<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Beagle xM Rev C<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">No EEPROM on expansion board<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">No EEPROM on expansion board<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Die ID #689000029ff80000016842c81202f014<o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal">Net: &nbsp; Net Initialization Skipped<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal">No ethernet found.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Hit any key to stop autoboot: &nbsp;0&nbsp;<o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal">The user button is currently NOT pressed.<o:p></o:p>=
</p>
</div>
<div>
<p class=3D"MsoNormal">SD/MMC found on device 0<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">reading uEnv.txt<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">** Unable to read &quot;uEnv.txt&quot; from mmc 0:1 =
**<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Loading file &quot;/boot/uImage&quot; from mmc devic=
e 0:2 (xxa2)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">3148568 bytes read<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Booting from mmc ...<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">## Booting kernel from Legacy Image at 80200000 ...<=
o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Image Name: &nbsp; Linux-2.6.32<o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Image Type: &nbsp; ARM Linux Kernel Ima=
ge (uncompressed)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Data Size: &nbsp; &nbsp;3148504 Bytes =
=3D 3 MiB<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Load Address: 80008000<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Entry Point: &nbsp;80008000<o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Verifying Checksum ... OK<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp;Loading Kernel Image ... OK<o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal">OK<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Starting kernel ...<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Uncompressing Linux.................................=
...........................................................................=
...........................................................................=
..................... done, booting
 the kernel.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">AND NOTHING AFTER THIS... Any clue how to proceed..?=
&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I posted in this mailing list, just because i'm usin=
g the meta-ti layer. Please do let me know if there is another one..!<o:p><=
/o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Best,<br clear=3D"all">
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">---------------------------------<br>
Sudhangathan BS<br>
Ph:(&#43;91) 9731-905-205<br>
---------------------------------<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_68f4dfd4107847b8b02ec486eff4e492AMXPR05MB085eurprd05pro_--
