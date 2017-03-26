Return-Path: <yury.lunev@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7957E00AD5; Sat, 25 Mar 2017 18:30:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (yury.lunev[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8817CE00AB7
	for <meta-ti@yoctoproject.org>; Sat, 25 Mar 2017 18:30:07 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id v2so3044909lfi.2
	for <meta-ti@yoctoproject.org>; Sat, 25 Mar 2017 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:cc:to; bh=26rUMlTD4el9/GHCn8GBzR02Aukffowc1FAA0gL4Nys=;
	b=fDUI9R6v6NfVa0gkCLSGjkRqJ+s9cSe5YX3rtPBYwTvrnBviHyKLGkQWn8vUHy5/Qc
	vvtiwHMLCGv8zO+k7GggET7Fb28KK9j3FoDBGmyJCZFZyXTTA/9dZxzFD4Bk/02l9sT1
	KFBR8t20Ib2Oepr0qDxDmtmJquGd9DgeUlDeiU2NMKm2/E7axytjnpQ1ilsvtmT1JKws
	N1p+Dt7MgubumZHqXyCxmxQ22PsuwchKCemVexW0b+xB9wk13YEKYxrT2KCTtG8M1dkT
	+4bgXtMkoQ63OGkPPBwAusBffcUbbnuBXApN55bAVUBNy4XxiT+/VR962TAcSjakXICf
	14vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:cc:to;
	bh=26rUMlTD4el9/GHCn8GBzR02Aukffowc1FAA0gL4Nys=;
	b=F8nHDIuE/9pyjHOo6vfuYB506x5nfjb1S0AKFwJZvKXzWUKBQu0WBuuqKGMl7DsJgG
	NjosDTZPK3L98Gdva/0+J+75sJ+sq3Z5w6Zfpb7ajcYlKfhQikeOGQzQSXwTYElzFSzq
	y0yJjyAXVscgFZ1yYIi71Q5eWjA3v34v7fiPQJQBTo+mKOEW8R9fmpn6OZiPzMJWDLRK
	9DrDJd2yE9v/oN1r78Abfz+x9cDUeFh5rDj7lp/d4gTE/YrjCDavtYIOZEqhQCksOHbp
	xsFjksTRnOfOos7YN8qyNa9SHv6K8M2IUMhuywh4Tsce6Ph+EVVvMEIAczQIRtwLX1Kc
	Qjcg==
X-Gm-Message-State: AFeK/H0AihQpmk0JDedkaa1mRIbZ0KUI1kfIOPXjfOlhZMFcbDviTats0voAGfWGq0Q+YQ==
X-Received: by 10.25.115.144 with SMTP id h16mr7255647lfk.46.1490491806129;
	Sat, 25 Mar 2017 18:30:06 -0700 (PDT)
Received: from [192.168.1.3] ([31.23.55.122])
	by smtp.gmail.com with ESMTPSA id 30sm1133843lju.53.2017.03.25.18.30.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Mar 2017 18:30:05 -0700 (PDT)
From: Yury Luneff <yury.lunev@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Message-Id: <698E70FE-FEC5-4D18-A474-E32176B34F91@gmail.com>
Date: Sun, 26 Mar 2017 04:30:04 +0300
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.3259)
Subject: Weston not starting up with SGX drivers on BeagleBone Black
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
X-List-Received-Date: Sun, 26 Mar 2017 01:30:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello!

I=E2=80=99m trying to get Weston running on BeagleBone Black with TI=E2=80=
=99s SGX drivers. Kernel is 4.9.13-g102f61776e from meta-ti (morty =
branch) and the drivers alike.
I have Weston 1.11 with patches from meta-arago (the patch that forces =
using card0 whereas I have card0 for tilcdc and card1 for pvrsrvkm plus =
the Mesa/GBM dealing patch). I had it running with SGX drivers already, =
but all of a sudden it ceased to startup properly.

# weston --tty=3D1 -B drm-backend.so --current-mode
=E2=80=A6
[16:07:05.845] Output HDMI-A-1, (connector 26, crtc 24)
               mode 1360x768@60.4, preferred, current
...
[16:07:05.957] set mode failed: Invalid argument

I=E2=80=99ve posted complete Weston startup log here: =
http://pastebin.com/bHbdDMas

The failure reason is listed in dmesg log:
tilcdc 4830e000.lcdc: Invalid pitch: fb and crtc widths must be the same

I see the patch comments in https://patchwork.kernel.org/patch/7856821/ =
that introduced this sanity check for tilcdc, but I=E2=80=99m not sure =
how to achieve proper setup with my case.

I have put 'gbm-format=3Drgb565=E2=80=99 in /etc/weston.ini. tilcdc=E2=80=99=
s pixel format seems to be the same: =
/sys/bus/platform/drivers/tilcdc/4830e000.lcdc/graphics/fb0/bits_per_pixel=
 equals to 16.

I=E2=80=99m not sure how tilcdc and pvrsrvkm should work between each =
other but the result is weston/wayland not starting because of some =
framebuffer mode conflict.

I had it working very little time ago and I did it by specifying =
--current-mode for Weston, but now this option doesn=E2=80=99t help as =
Weston tries to set_mode anyway.

Please, give me an advice on how to debug this.

Thanks!
=E2=80=94
Yury Lunev



