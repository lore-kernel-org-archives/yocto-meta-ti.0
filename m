Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0452DE00BE6; Wed, 24 Feb 2016 04:46:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB652E00C95
	for <meta-ti@yoctoproject.org>; Wed, 24 Feb 2016 04:46:31 -0800 (PST)
Received: by mail-pf0-f175.google.com with SMTP id c10so13039319pfc.2
	for <meta-ti@yoctoproject.org>; Wed, 24 Feb 2016 04:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=16CbCtHUNmwptaLvZmf07zP4SbHx1kYq0GfzU3XNx8c=;
	b=R5ez7/4TL2y4NIi53u9aN3Xcb2BwHXJjlI3GmuLbyWemyiZmRslPenXDnAk/lT/+W5
	lZWfpNXyd/Sr97ncIPqC0o/fbzEwYkVL1Gxd2F+eD2lSdPkjSrKGHn6cQbSLrIwZI7ve
	WE4VGGBq9EsBNOBtc+P4AfLBx/ole1tGGGL+v2FexWkqiEW3mbQOBkXisf5tEI/kB5g5
	mhf8P+hqdnqqFaiUDv2zxb6lzauuuohwnKOS5ip6WQtrZKLChP5o1yea9QIvyX0TGps5
	BzUTLrKgx7jBaJL3YyJ3w1yl41uZWpJAamhTA2wts5ZhXmV/zhtV1pxseLK2Pb9pgUIs
	RSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=16CbCtHUNmwptaLvZmf07zP4SbHx1kYq0GfzU3XNx8c=;
	b=m/4Q5cGkQMY/tYGJWtdH+F2q8M0jfqRcmbkQojIdJgfvwJ4Kg3hEjIPW328R3mASdi
	zCTwz1KzUWtGDkfFa6nM+204WB9EbNJKwOfz2V4N0UpplAhM6+BJexe5gH+XOUQWCdml
	6hjt+n48gYCXcNi0UD3MKbA3Z4314ovlE3tKLM3rmVuDaF9O5x8IxwzYd3931yvWDYr5
	XAbYRbkJX5qHe09vEeAOold7YntcNR+sny75Z6rXT8GCy/Prs5s4nJTl3kQqXCQNjWE2
	rUakUOCSZpk/vuietSdvVPE5Q94LDpCIeL9SNWG5ZK/D+yDUaxsmEddip/AOvZVhcFZ3
	PGZQ==
X-Gm-Message-State: AG10YOTPnTC6afkacY7ZCDW6ini2+QTjksGMa9esCXPYOlVQCHD9l8KnKwpUwBKe//cw4g==
X-Received: by 10.98.40.4 with SMTP id o4mr7925696pfo.76.1456317991071;
	Wed, 24 Feb 2016 04:46:31 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	b63sm4978943pfj.25.2016.02.24.04.46.27
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 04:46:29 -0800 (PST)
Message-ID: <AB28D54196164B23BA942EBCF3204741@RD3>
From: <winiston@futuraautomation.com>
To: "OpenEmbedded core" <openembedded-core@lists.openembedded.org>,
	"Yocto layer" <linux-yocto@yoctoproject.org>
Date: Wed, 24 Feb 2016 18:20:14 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: How to integrate third party application software to yocto image
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
X-List-Received-Date: Wed, 24 Feb 2016 12:46:36 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00D3_01D16F30.01A774C0"

------=_NextPart_000_00D3_01D16F30.01A774C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I can build yocto image for arm based product like AM437x-evm using =
yocto project. I want to add third party software(Navit) to my image.

How can I add the third party software to my image ?. Can you provide me =
the steps to integrate third party software with yocto image ?

Note: Navit is a navigation software and it supports arm based product =
like AM437x.=20

Host system: Ubuntu 14.04
Target system : AM437x-evm


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_00D3_01D16F30.01A774C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I can build yocto image for arm based product like AM437x-evm using =
yocto=20
project. I want to add third party software(Navit) to my image.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>How can I add the third party software to my =
image ?.=20
Can you provide me the steps to integrate third party software with =
yocto image=20
?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Note: Navit is a navigation software and it =
supports=20
arm based product like AM437x.</FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Host system: Ubuntu 14.04</DIV>
<DIV>Target system : AM437x-evm</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_00D3_01D16F30.01A774C0--
