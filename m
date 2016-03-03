Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98F24E009EA; Thu,  3 Mar 2016 02:55:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=unavailable version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.49 listed in list.dnswl.org]
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99CE6E00973
	for <meta-ti@yoctoproject.org>; Thu,  3 Mar 2016 02:55:55 -0800 (PST)
Received: by mail-pa0-f49.google.com with SMTP id fi3so11126804pac.3
	for <meta-ti@yoctoproject.org>; Thu, 03 Mar 2016 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:subject:date:mime-version:importance
	:disposition-notification-to;
	bh=eIW7IQRG1t8EfXDjnxgarIxuBZV2QSjklmrUWlgYx9Q=;
	b=JqHNowE/jtpoOtnSnX4AZKaNRCaJCuzZ5JfoEJ63QOfsB4Cevfw6I4c8Lyhxuo2lKD
	3OBNwO5lx18KCEL/9HwoUoDwZuHgkOtlkVplFlUG+PP4gDa+VN+Ew1QqqwyaIBybOgFC
	yBqppPk9YigUIqAONAgUfFlOniTnn0pwjfJ78xSNzzrNx2NDk2t0nNBE/1J+L6qXeOWK
	IfViR7/eum/j6mfSVOZPcM1KioMdfUIpp6YHaoJuqv+dzwY18WSEgUQYWVrvniJixbJH
	RLIcJ4C8rbUInDq6Cef4VQ+6AE4QUK0zmCXRKdC4zRSf1MKsqQdS4++nAV6/ml6Ketb5
	7Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
	:importance:disposition-notification-to;
	bh=eIW7IQRG1t8EfXDjnxgarIxuBZV2QSjklmrUWlgYx9Q=;
	b=OVLr9u0z8iYWagSCPPJkQ/PJjeqlWGsg0O5FDz9A7vvqUVn2JFYwisId0Payiooer/
	mG5IyeDc3EZE5lD4Q32Gj6nXF7EXLa0B/WcYtVAYhBgbr3GUgvpV34I31jD49MFF/PXR
	f7B0LG4vTRgPWfSHLAzqDzD+ES9MJaCAolzrvDBdD54X5NUM2mjsA5ddyD9iehk9PSJC
	aNqVETvszl2tvYSk685ZwWCiALpK6X8aEVQCRqNyvWUINPDqHoapny0SVRFuXDe6RQaE
	zeVzb6BmiLvxBf4INOxiFP4Iom+0YRM8aiQHITcCHSAbA7/KyZUFKAnOPlxGZLndMRJE
	Vx2g==
X-Gm-Message-State: AD7BkJJ9vLkaD3t2UWtgD0mKlDpwyc27l5W69OK7bK5yi+1tqbYuAg5TQht7L5KOJkvSbQ==
X-Received: by 10.66.145.194 with SMTP id sw2mr2612645pab.69.1457002554710;
	Thu, 03 Mar 2016 02:55:54 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	kw10sm59771935pab.0.2016.03.03.02.55.51
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 02:55:53 -0800 (PST)
Message-ID: <D6104635BEC047C6A117367EE5F6969D@RD3>
From: <winiston@futuraautomation.com>
To: "OpenEmbedded core" <openembedded-core@lists.openembedded.org>,
	"Yocto layer" <linux-yocto@yoctoproject.org>
Date: Thu, 3 Mar 2016 16:29:20 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: How to add recipes-navigation in core-image-base
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
X-List-Received-Date: Thu, 03 Mar 2016 10:55:56 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01EE_01D17569.D6C278A0"

------=_NextPart_000_01EE_01D17569.D6C278A0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to use =E2=80=9Crecipes-navigation=E2=80=9D in my yocto build =
(Poky ) . How do I add=E2=80=9D recipes-navigation =E2=80=9C to my =
image?

I have downloaded =E2=80=9C recipes-navigation =E2=80=9C from =
=E2=80=9Copen embedded project=E2=80=9D. Is it compatible with yocto =
build (poky ) ?

Note: Ultimately I wanted to integrate =E2=80=9CNavit=E2=80=9D to my =
image.           =E2=80=9Crecipes-navigation =E2=80=9C has =
=E2=80=9Cnavit=E2=80=9D.
How do I achieve this =E2=80=9CNavit=E2=80=9D integration in my image?

Target Image    : image-core-base
Target machine : AM437x-evm
Host Machine   :  Ubuntu 14.04=20
I am looking forward to your valuable reply. If you need any more =
details, Let me know please.

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_01EE_01D17569.D6C278A0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I wanted to use =E2=80=9Crecipes-navigation=E2=80=9D in my yocto =
build (Poky ) . <FONT=20
color=3D#0000ff>How do I add=E2=80=9D recipes-navigation =E2=80=9C to my =
image?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>I have downloaded =E2=80=9C recipes-navigation =E2=80=9C from =
=E2=80=9Copen embedded project=E2=80=9D.=20
<FONT color=3D#0000ff>Is it compatible with yocto build (poky ) =
?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Note: Ultimately I wanted to integrate =
=E2=80=9CNavit=E2=80=9D to my=20
image.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
=E2=80=9Crecipes-navigation =E2=80=9C has =
=E2=80=9Cnavit=E2=80=9D.</FONT></DIV>
<DIV><FONT color=3D#0000ff>How do I achieve this =E2=80=9CNavit=E2=80=9D =
integration in my=20
image?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Target Image&nbsp;&nbsp;&nbsp; : image-core-base</DIV>
<DIV>Target machine : AM437x-evm</DIV>
<DIV>Host Machine&nbsp;&nbsp; :&nbsp; Ubuntu 14.04 </DIV>
<DIV>I am looking forward to your valuable reply. If you need any more =
details,=20
Let me know please.</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_01EE_01D17569.D6C278A0--
