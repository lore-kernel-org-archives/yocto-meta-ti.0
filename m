Return-Path: <johnegq@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98573E00D1B; Wed, 30 Jan 2019 11:01:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (johnegq[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.52 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay
	lines
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC3DFE00D15
	for <meta-ti@yoctoproject.org>; Wed, 30 Jan 2019 11:01:08 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id a8so460616lfk.5
	for <meta-ti@yoctoproject.org>; Wed, 30 Jan 2019 11:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:date:message-id:subject:to;
	bh=ODN/kEuzDF8IN2709hlKSjGk0hFMO2mYmcE/htY1sTI=;
	b=spPEfd9pVHvrYW6MiwNl9JkhQ9D/hETI5+odgQU6QApakN2ZDgBfcfhYLteh6+3DRe
	jtsQKUFGFuQFHzR9C4dgo8YS0N6xNlgyv+frZ5soJbEv+vvSio97DA8aJYANdMtGqhxz
	7yF6VMWwwbjEiLiThQpz2cVkEbBnJ34BI2AQFECXCZilRWq0SUb2Icu7C4XF0Qc3Q+bc
	8l7Z/hmENi1OC2cC9287jYjKbiDWukQYBb1YDYa/uT/y+GbbGrLtgBKRoIC0cAufNdJq
	rdxuqwP+OX2E9G3yoZZmkEWZIBoOjWTsyJPG/4p5OTzpaLvIHJWDC2+PNfdBQQ0LF0cr
	aVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=ODN/kEuzDF8IN2709hlKSjGk0hFMO2mYmcE/htY1sTI=;
	b=AFgpnbDbLZeTod8vMoqKzZsQTMuf3nxkeusgN1ZuRHt/ndRUxTr5HXs3Ge6II/gs7n
	N+HS7r6+ywzvaHtq2jFCQSe0Gx9OuMdknHOvp9ZHZp7CoVGKC1T5Bu0ZlraQueJ80Tz5
	qxiDB53C43a6CbZZWvDTztdErGfFZWy1CHGmTgJrFiKz26SdX7ndQ3u3wZMKWamoLnee
	sYxt2yOp4oAYF/+e+enRLghNAPrzR9Ni4joF9qFuazLKbLbmmvq5u8GYgx08hWEcdTty
	R00C7lx3SVucoY3n77d2twmpZXwuno+7wixIxmHReVR3KVeKfjsZ8EjE9+6lr/DRdtzS
	PhOg==
X-Gm-Message-State: AJcUukeKJifSSaT7lPfd6+KfNIasDToVTwyigf5H1TPdRuucAu0c4sf4
	5Ctw0szsHisXDuGqnRvWMDk3mPrZ2vMx2VCXI0QOnA==
X-Google-Smtp-Source: ALg8bN4cFZscEjfF2SSQRrnrOC1kjFINqgWZrGh8Tos4YHtgeFX6Jqq8xSYHzI5A35DgmFAqGkqm6eoOP6ea+L7cR7Y=
X-Received: by 2002:a19:5394:: with SMTP id h20mr13728110lfl.75.1548874867224; 
	Wed, 30 Jan 2019 11:01:07 -0800 (PST)
Received: from 1058052472880 named unknown by gmailapi.google.com with
	HTTPREST; Wed, 30 Jan 2019 14:01:05 -0500
From: JohnE Gledhill <johnegq@gmail.com>
X-Mailer: Airmail (528)
MIME-Version: 1.0
Date: Wed, 30 Jan 2019 14:01:05 -0500
Message-ID: <CAEHWc-mC_BwGGgUxzW+gr8O4WQmo1i25T2jhfvfBWd=PQMg7LA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: beaglebone black wireless how to generate am335x-boneblack-wireless.dtb
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
X-List-Received-Date: Wed, 30 Jan 2019 19:01:09 -0000
Content-Type: multipart/alternative; boundary="0000000000004332eb0580b188c4"

--0000000000004332eb0580b188c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,  I have successfully built a generic yocto image. I use the
following config:
  MACHINE ?=3D =E2=80=9Cbeaglebone"

I run standard build:
  $ bitbake  core-image-full-cmdline

But only two .dtb files are
generated: am335x-bone.dtb, am335x-boneblack.dtb.
I found the a wireless .dts file at:

./tmp/work-shared/beaglebone/kernel-source/arch/arm/boot/dts/am335x-bonebla=
ck-wireless.dts

How do I also generate an am335x-boneblack-wireless.dtb file for the
beaglebone black wireless?

Thanks!!

--0000000000004332eb0580b188c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>body{font-family:Helvetica,Arial;font-size:13px}</style>=
</head><body style=3D"word-wrap:break-word"><div id=3D"bloop_customfont" st=
yle=3D"font-family:Helvetica,Arial;font-size:13px;margin:0px;line-height:au=
to">Hello, =C2=A0I have successfully built a generic yocto image. I use the=
 following config:</div><div id=3D"bloop_customfont" style=3D"font-family:H=
elvetica,Arial;font-size:13px;margin:0px;line-height:auto"><div id=3D"bloop=
_customfont" style=3D"margin:0px">=C2=A0 MACHINE ?=3D =E2=80=9Cbeaglebone&q=
uot;</div><div id=3D"bloop_customfont" style=3D"margin:0px"><br></div><div =
id=3D"bloop_customfont" style=3D"margin:0px">I run standard build:=C2=A0</d=
iv><div>=C2=A0 $ bitbake =C2=A0core-image-full-cmdline</div></div><br><div =
class=3D"bloop_sign" id=3D"bloop_sign_1548870135664577024">But only two .dt=
b files are generated:=C2=A0am335x-bone.dtb,=C2=A0am335x-boneblack.dtb.</di=
v><div class=3D"bloop_sign" id=3D"bloop_sign_1548870135664577024">I found t=
he a wireless .dts file at: =C2=A0</div><div class=3D"bloop_sign" id=3D"blo=
op_sign_1548870135664577024">=C2=A0 ./tmp/work-shared/beaglebone/kernel-sou=
rce/arch/arm/boot/dts/am335x-boneblack-wireless.dts</div><div class=3D"bloo=
p_sign" id=3D"bloop_sign_1548870135664577024"><br></div><div class=3D"bloop=
_sign" id=3D"bloop_sign_1548870135664577024">How do I also generate an=C2=
=A0am335x-boneblack-wireless.dtb file for the beaglebone black wireless?</d=
iv><div class=3D"bloop_sign" id=3D"bloop_sign_1548870135664577024"><br></di=
v><div class=3D"bloop_sign" id=3D"bloop_sign_1548870135664577024">Thanks!!<=
/div><div class=3D"bloop_sign" id=3D"bloop_sign_1548870135664577024"><br></=
div></body></html>

--0000000000004332eb0580b188c4--
