Return-Path: <Fahad_Arslan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72018E00B52; Wed, 18 Nov 2015 07:16:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0306E00B19
	for <meta-ti@yoctoproject.org>; Wed, 18 Nov 2015 07:16:34 -0800 (PST)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zz4TJ-0006jP-Mn from Fahad_Arslan@mentor.com 
	for meta-ti@yoctoproject.org; Wed, 18 Nov 2015 07:16:33 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.69]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Wed, 18 Nov 2015 15:16:26 +0000
From: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: unrecognized config options --enable-kms
	--enable-install-test-programs warning
Thread-Index: AdEiE6z9aAxPfzdeTAeJnd1+fsLqww==
Date: Wed, 18 Nov 2015 15:16:26 +0000
Message-ID: <2B9C97B395470A40B9E9E5D469BCD9FA176F95FE@EU-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: unrecognized config options --enable-kms --enable-install-test-programs warning
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
X-List-Received-Date: Wed, 18 Nov 2015 15:16:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2B9C97B395470A40B9E9E5D469BCD9FA176F95FEEUMBX02mgcmento_"

--_000_2B9C97B395470A40B9E9E5D469BCD9FA176F95FEEUMBX02mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm getting following warning while baking libdrm (meta-ti/recipes-graphics=
/drm/libdrm_2.4.41.bb):

WARNING: QA Issue: libdrm: configure was passed unrecognised options:  [unk=
nown-configure-option]

Shouldn't we update EXTRA_OECONF to exclude --enable-kms and --enable-insta=
ll-test-programs?

Thanks,
Fahad

--_000_2B9C97B395470A40B9E9E5D469BCD9FA176F95FEEUMBX02mgcmento_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi,
<br>
<br>
I'm getting following warning while baking libdrm (meta-ti/recipes-graphics=
/drm/libdrm_2.4.41.bb):<br>
<br>
WARNING: QA Issue: libdrm: configure was passed unrecognised options:&nbsp;=
 [unknown-configure-option]<br>
<br>
Shouldn't we update EXTRA_OECONF to exclude --enable-kms and --enable-insta=
ll-test-programs?<br>
<br>
Thanks,<br>
Fahad<br>
</div>
</body>
</html>

--_000_2B9C97B395470A40B9E9E5D469BCD9FA176F95FEEUMBX02mgcmento_--
