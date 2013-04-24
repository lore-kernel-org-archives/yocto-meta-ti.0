Return-Path: <SAbramenkova@luxoft.com>
Received: from msk-edge-04.luxoft.com (msk-edge-04.luxoft.com
	[213.208.171.187])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7914E0054B
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2013 10:08:48 -0700 (PDT)
Received: from MSK-HUBT-04.luxoft.com (172.30.50.90) by msk-edge-04.luxoft.com
	(172.30.16.187) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Wed, 24 Apr 2013 21:08:44 +0400
Received: from MSK-MBOX-04.luxoft.com ([fe80::64f4:ed23:7673:536f]) by
	MSK-HUBT-04.luxoft.com ([::1]) with mapi id 14.02.0342.003;
	Wed, 24 Apr 2013 21:08:42 +0400
From: "Abramenkova, Svetlana" <SAbramenkova@luxoft.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Linux image for OMAP5 
Thread-Index: Ac5BCa1E8ldHYJKoSA+jBjz0nbk5KQ==
Date: Wed, 24 Apr 2013 17:08:42 +0000
Message-ID: <C3024233E31E8449B5487F2C1EFB9F8ECCDE@msk-mbox-04.luxoft.com>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.16.217]
MIME-Version: 1.0
Subject: Linux image for OMAP5
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
X-List-Received-Date: Wed, 24 Apr 2013 17:08:49 -0000
Content-Language: ru-RU
Content-Type: multipart/alternative;
	boundary="_000_C3024233E31E8449B5487F2C1EFB9F8ECCDEmskmbox04luxoftcom_"

--_000_C3024233E31E8449B5487F2C1EFB9F8ECCDEmskmbox04luxoftcom_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi,

I trying to create a Linux image for OMAP5 processor. I cloned meta-ti git =
repository (git://git.yoctoproject.org/meta-ti) and tried follow steps from=
 http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment. I ma=
de changes in setenv file for meta-ti repository(BBPATH=3D$OEBASE/meta-ti) =
and in local configuration file for OMAP5 (MACHINE =3D "omap5-evm"). When I=
  start to build the image getting an error:
"FATAL: Unable to parse [] (Could not include required file conf/machine/in=
clude/soc-family.inc)"
It seems that I have not enough files.

Could you please provide help with setting up build environment?

Thanks for advance,
Sveta

________________________________

This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this email or its attachment(s). Furthermore, yo=
u are hereby notified that any dissemination, distribution or copying of th=
is e-mail and any attachment(s) is strictly prohibited. If you have receive=
d this e-mail in error, please immediately notify the sender by replying to=
 this e-mail and then delete this e-mail and any attachment(s) or copies th=
ereof from your system. Thank you.

--_000_C3024233E31E8449B5487F2C1EFB9F8ECCDEmskmbox04luxoftcom_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<style id=3D"owaParaStyle" type=3D"text/css">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
</head>
<body>
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">Hi,<br>
<br>
I trying to create a Linux image for OMAP5 processor. I cloned meta-ti git =
repository (<a href=3D"">git://git.yoctoproject.org/meta-ti</a>) and tried =
follow steps from http://arago-project.org/wiki/index.php/Setting_Up_Build_=
Environment. I made changes in setenv
 file for meta-ti repository(BBPATH=3D$OEBASE/meta-ti) and in local configu=
ration file for OMAP5 (MACHINE =3D &quot;omap5-evm&quot;). When I&nbsp; sta=
rt to build the image getting an error:<br>
&quot;FATAL: Unable to parse [] (Could not include required file conf/machi=
ne/include/soc-family.inc)&quot;<br>
It seems that I have not enough files.<br>
<br>
Could you please provide help with setting up build environment?<br>
<br>
Thanks for advance,<br>
Sveta<br>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1"><br>
This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this
 email or its attachment(s). Furthermore, you are hereby notified that any =
dissemination, distribution or copying of this e-mail and any attachment(s)=
 is strictly prohibited. If you have received this e-mail in error, please =
immediately notify the sender by
 replying to this e-mail and then delete this e-mail and any attachment(s) =
or copies thereof from your system. Thank you.<br>
</font>
</body>
</html>

--_000_C3024233E31E8449B5487F2C1EFB9F8ECCDEmskmbox04luxoftcom_--
