Return-Path: <vchengalvala@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8059DE007CD; Thu, 22 Jan 2015 07:52:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7993E005B4
	for <meta-ti@yoctoproject.org>; Thu, 22 Jan 2015 07:52:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0MFqRtG002339
	for <meta-ti@yoctoproject.org>; Thu, 22 Jan 2015 09:52:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0MFqQVU010087
	for <meta-ti@yoctoproject.org>; Thu, 22 Jan 2015 09:52:26 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 22 Jan 2015 09:52:26 -0600
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [RFC PATCH] Increasing the max_leb_count
Thread-Index: AQHQNaxiDaN59Us0n0i2YDn+JDF8/5zMQAmA
Date: Thu, 22 Jan 2015 15:52:26 +0000
Deferred-Delivery: Thu, 22 Jan 2015 15:52:00 +0000
Message-ID: <FCB36D0BED1F0D4EA8E6242507E4245B0C7E25DE@DFLE08.ent.ti.com>
References: <1421862770-30804-1-git-send-email-a0393906@ti.com>
	<20150121185832.GE21328@edge>
In-Reply-To: <20150121185832.GE21328@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RFC PATCH] Increasing the max_leb_count
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
X-List-Received-Date: Thu, 22 Jan 2015 15:52:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_FCB36D0BED1F0D4EA8E6242507E4245B0C7E25DEDFLE08entticom_"

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C7E25DEDFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik, Denys,



Jake is currently out on vacation and will be back next week. Back in Novem=
ber, we started to see build failures creating the tisdk-rootfs, specifical=
ly when making the UBI filesystem because of max_leb_cnt.

Hence, Jake picked a value that was slightly greater than the reported mini=
mum size required. The proposal to increase it to 5120 looks fine.



Regards,

Vivek





For am57xx-evm, (http://gtjenkins.itg.ti.com/nightly_builds/mcsdk-8.0.x/134=
-2014-11-25_20-40-31/artifacts/output/results/build-2014-11-25_22-20-58/log=
-files/am57xx-evm-error-logs/tisdk-rootfs-image_1.0-r0_do_rootfs.log) :



NOTE: The image creation groups are: [['tar', 'ubi']]

NOTE: Running image creation script for tar: /home/gtbldadm/ti/oe-layersetu=
p/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-lin=
ux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_image.tar ...

NOTE: Running image creation script for ubi: /home/gtbldadm/ti/oe-layersetu=
p/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-lin=
ux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_image.ubi ...

ERROR: Error: The image creation script '/home/gtbldadm/ti/oe-layersetup/bu=
ild-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-linux-g=
nueabi/tisdk-rootfs-image/1.0-r0/temp/create_image.ubi' returned 255:

Error: max_leb_cnt too low (3980 needed)

WARNING: /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-=
linaro-toolchain/work/am57xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0=
/temp/create_image.ubi:1 exit 255 from

  mkfs.ubifs -r /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/am57xx_evm-oe-linux-gnueabi/tisdk-rootfs-image=
/1.0-r0/rootfs -o /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-=
external-linaro-toolchain/deploy/images/am57xx-evm/tisdk-rootfs-image-am57x=
x-evm-20141126032606.rootfs.ubifs -F -m 2048 -e 126976 -c 3836



DEBUG: Python function do_rootfs finished

ERROR: Function failed: do_rootfs





For dra7xx-evm (http://gtjenkins.itg.ti.com/nightly_builds/mcsdk-8.0.x/134-=
2014-11-25_20-40-31/artifacts/output/results/build-2014-11-26_00-55-49/log-=
files/dra7xx-evm-error-logs/tisdk-rootfs-image_1.0-r0_do_rootfs.log) :



NOTE: The image creation groups are: [['tar', 'ubi']]

NOTE: Running image creation script for tar: /home/gtbldadm/ti/oe-layersetu=
p/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-lin=
ux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_image.tar ...

NOTE: Running image creation script for ubi: /home/gtbldadm/ti/oe-layersetu=
p/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-lin=
ux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_image.ubi ...

ERROR: Error: The image creation script '/home/gtbldadm/ti/oe-layersetup/bu=
ild-CORTEX_1/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-linux-g=
nueabi/tisdk-rootfs-image/1.0-r0/temp/create_image.ubi' returned 255:

Error: max_leb_cnt too low (4156 needed)

WARNING: /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-=
linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0=
/temp/create_image.ubi:1 exit 255 from

  mkfs.ubifs -r /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/tisdk-rootfs-image=
/1.0-r0/rootfs -o /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-=
external-linaro-toolchain/deploy/images/dra7xx-evm/tisdk-rootfs-image-dra7x=
x-evm-20141126060210.rootfs.ubifs -F -m 2048 -e 126976 -c 3836



DEBUG: Python function do_rootfs finished

ERROR: Function failed: do_rootfs







-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Wednesday, January 21, 2015 1:59 PM
To: R, Karthik
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [RFC PATCH] Increasing the max_leb_count



Vivek, Jake,



I suggested that Karthik sends an RFC to get your input on this matter. My =
concern is that we have large enough flash and enough storage space left fo=
r anything else you might want to store (e.g. backup/recovery images, etc.)



Please provide your feedback for this patch. Thanks.



--

Denys





On Wed, Jan 21, 2015 at 11:22:48PM +0530, Karthik Ramanan wrote:

> Background:

>

> * GLSDK brings in a lot of multimedia and graphics

>   enabling components as well as example applications.

> * Customers are going to add more software layers on top

>   of this to enable more feature rich graphics and multimedia.

> * There are two configurations that are used internally:

>    ** Release filesystem

>    ** Debug filesystem - (Release + GDB + dbg-pkgs)

>       dbg-pkgs is basically the EXTRA_MACHINE_FEATURES in

>       the local.conf that brings in the sources and debug

>       symbols to allow gdb debugging.

>

> With the current leb_count it is not possible to support

> the above usecases. And to allow for enough room for the

> customer to add their components and not hit the space

> issue, it is proposed to make this change.

>

> Karthik Ramanan (1):

>   dra7xx-evm: ubifs: Increase "max_leb_cnt"

>

>  conf/machine/dra7xx-evm.conf |    2 +-

>  1 file changed, 1 insertion(+), 1 deletion(-)

>

> --

> 1.7.9.5

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--

_______________________________________________

meta-ti mailing list

meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

https://lists.yoctoproject.org/listinfo/meta-ti

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C7E25DEDFLE08entticom_
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
	{font-family:SimSun-ExtB;
	panose-1:2 1 6 9 6 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Karthik, Denys,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Jake is currently out on vacation and will be bac=
k next week. Back in November, we started to see build failures creating th=
e tisdk-rootfs, specifically when making the UBI filesystem because of max_=
leb_cnt.
<o:p></o:p></p>
<p class=3D"MsoPlainText">Hence, Jake picked a value that was slightly grea=
ter than the reported minimum size required. The proposal to increase it to=
 5120 looks fine.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Regards,<o:p></o:p></p>
<p class=3D"MsoPlainText">Vivek<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><b><u>For am57xx-evm</u></b>, (http://gtjenkins.i=
tg.ti.com/nightly_builds/mcsdk-8.0.x/134-2014-11-25_20-40-31/artifacts/outp=
ut/results/build-2014-11-25_22-20-58/log-files/am57xx-evm-error-logs/tisdk-=
rootfs-image_1.0-r0_do_rootfs.log)
 :<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">NOTE: The image creation groups are: [['tar', 'ub=
i']]<o:p></o:p></p>
<p class=3D"MsoPlainText">NOTE: Running image creation script for tar: /hom=
e/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/work/am57xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_=
image.tar ...<o:p></o:p></p>
<p class=3D"MsoPlainText">NOTE: Running image creation script for ubi: /hom=
e/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/work/am57xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_=
image.ubi ...<o:p></o:p></p>
<p class=3D"MsoPlainText">ERROR: Error: The image creation script '/home/gt=
bldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
work/am57xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_imag=
e.ubi' returned 255:<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"background:yellow;mso-highlight:ye=
llow">Error: max_leb_cnt too low (3980 needed)</span><o:p></o:p></p>
<p class=3D"MsoPlainText">WARNING: /home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-linux-gnueabi=
/tisdk-rootfs-image/1.0-r0/temp/create_image.ubi:1 exit 255 from<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&nbsp; mkfs.ubifs -r /home/gtbldadm/ti/oe-layerse=
tup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-l=
inux-gnueabi/tisdk-rootfs-image/1.0-r0/rootfs -o /home/gtbldadm/ti/oe-layer=
setup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/deploy/images/am57=
xx-evm/tisdk-rootfs-image-am57xx-evm-20141126032606.rootfs.ubifs
 -F -m 2048 -e 126976 -c 3836<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">DEBUG: Python function do_rootfs finished<o:p></o=
:p></p>
<p class=3D"MsoPlainText">ERROR: Function failed: do_rootfs<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><b><u>For dra7xx-evm</u></b> (http://gtjenkins.it=
g.ti.com/nightly_builds/mcsdk-8.0.x/134-2014-11-25_20-40-31/artifacts/outpu=
t/results/build-2014-11-26_00-55-49/log-files/dra7xx-evm-error-logs/tisdk-r=
ootfs-image_1.0-r0_do_rootfs.log)
 :<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">NOTE: The image creation groups are: [['tar', 'ub=
i']]<o:p></o:p></p>
<p class=3D"MsoPlainText">NOTE: Running image creation script for tar: /hom=
e/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/work/dra7xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_=
image.tar ...<o:p></o:p></p>
<p class=3D"MsoPlainText">NOTE: Running image creation script for ubi: /hom=
e/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/work/dra7xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_=
image.ubi ...<o:p></o:p></p>
<p class=3D"MsoPlainText">ERROR: Error: The image creation script '/home/gt=
bldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
work/dra7xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/create_imag=
e.ubi' returned 255:<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"background:yellow;mso-highlight:ye=
llow">Error: max_leb_cnt too low (4156 needed)</span><o:p></o:p></p>
<p class=3D"MsoPlainText">WARNING: /home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi=
/tisdk-rootfs-image/1.0-r0/temp/create_image.ubi:1 exit 255 from<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&nbsp; mkfs.ubifs -r /home/gtbldadm/ti/oe-layerse=
tup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-l=
inux-gnueabi/tisdk-rootfs-image/1.0-r0/rootfs -o /home/gtbldadm/ti/oe-layer=
setup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/deploy/images/dra7=
xx-evm/tisdk-rootfs-image-dra7xx-evm-20141126060210.rootfs.ubifs
 -F -m 2048 -e 126976 -c 3836<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">DEBUG: Python function do_rootfs finished<o:p></o=
:p></p>
<p class=3D"MsoPlainText">ERROR: Function failed: do_rootfs<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys<br>
Sent: Wednesday, January 21, 2015 1:59 PM<br>
To: R, Karthik<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [RFC PATCH] Increasing the max_leb_count</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Vivek, Jake,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I suggested that Karthik sends an RFC to get your=
 input on this matter. My concern is that we have large enough flash and en=
ough storage space left for anything else you might want to store (e.g. bac=
kup/recovery images, etc.)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Please provide your feedback for this patch. Than=
ks.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">Denys<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Wed, Jan 21, 2015 at 11:22:48PM &#43;0530, Kar=
thik Ramanan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Background:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; * GLSDK brings in a lot of multimedia and gr=
aphics<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; enabling components as well as e=
xample applications.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; * Customers are going to add more software l=
ayers on top
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; of this to enable more feature r=
ich graphics and multimedia.
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; * There are two configurations that are used=
 internally:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp; ** Release filesystem<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp; ** Debug filesystem - (Rel=
ease &#43; GDB &#43; dbg-pkgs)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dbg-pkgs=
 is basically the EXTRA_MACHINE_FEATURES in
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the loca=
l.conf that brings in the sources and debug<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; symbols =
to allow gdb debugging.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; With the current leb_count it is not possibl=
e to support
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; the above usecases. And to allow for enough =
room for the
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; customer to add their components and not hit=
 the space <o:p>
</o:p></p>
<p class=3D"MsoPlainText">&gt; issue, it is proposed to make this change.<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Karthik Ramanan (1):<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; dra7xx-evm: ubifs: Increase &quo=
t;max_leb_cnt&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; conf/machine/dra7xx-evm.conf |&nbsp;&n=
bsp;&nbsp; 2 &#43;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 1 insertion(&#43;), 1 =
deletion(-)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -- <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; 1.7.9.5<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -- <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ____________________________________________=
___<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; meta-ti mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">=
<span style=3D"color:windowtext;text-decoration:none">meta-ti@yoctoproject.=
org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <a href=3D"https://lists.yoctoproject.org/li=
stinfo/meta-ti">
<span style=3D"color:windowtext;text-decoration:none">https://lists.yoctopr=
oject.org/listinfo/meta-ti</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">-- <o:p></o:p></p>
<p class=3D"MsoPlainText">_______________________________________________<o=
:p></o:p></p>
<p class=3D"MsoPlainText">meta-ti mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"mailto:meta-ti@yoctoproject.org"><span=
 style=3D"color:windowtext;text-decoration:none">meta-ti@yoctoproject.org</=
span></a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://lists.yoctoproject.org/listinf=
o/meta-ti"><span style=3D"color:windowtext;text-decoration:none">https://li=
sts.yoctoproject.org/listinfo/meta-ti</span></a><o:p></o:p></p>
</div>
</body>
</html>

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C7E25DEDFLE08entticom_--
