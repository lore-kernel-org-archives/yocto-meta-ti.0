Return-Path: <seb.salmhofer@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33398E00CE8; Wed,  8 Jun 2016 04:15:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09509E00CCC
	for <meta-ti@yoctoproject.org>; Wed,  8 Jun 2016 04:15:19 -0700 (PDT)
Received: by mail-oi0-f42.google.com with SMTP id s139so7032647oie.2
	for <meta-ti@yoctoproject.org>; Wed, 08 Jun 2016 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=3CdHUHGubiUptWpV9eIiJB5dzVHuTWA7trIzLl6H/Zs=;
	b=EkVzCi/ajBlS21lWvkqQMmkx9peNxsXTviOtRgVcdn2BCDLId0Qk/NHdc7kt6z8GvQ
	XILU0btSW5vJweXGOO3ye5Sv/dAl30CoIqdSU6SUaOE43gprr5Hh4haPGTC+5CQbFnhE
	09+QML0OJQsr/m3WzQ3dZTurQez/pjNYgnZfazsui1r1u7Lk0O+6mZzCN/hdIgZUxyxw
	Uxj/4kvZHItMf5Q3GAir9uzgd47wZCDqn0GUXDCMTHbATnnzGxMw9RxVgWF1qKPKnnjK
	ysIMGebPCO/73nSuE+8F6aNkby/+O5fdr+dze0DlRkzSKHWQBOWm8RYF1+AAbJ3wPhp5
	EeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=3CdHUHGubiUptWpV9eIiJB5dzVHuTWA7trIzLl6H/Zs=;
	b=GogaIAr0JLo2drXFvnFbwNNpyvxU56hG4lSQAENVSHiWCCSQKDqy9TYqX+e0p77NlM
	DzdcfYu3CceFKwcMjBzq14qIvvxJKumDuL2FTjJFy7yUV0EMWYziqXUiKcRKHpJ+LEKM
	xuqdneYYO5vq8ZfqHN/U37foW6fTYxTq6w4hAHg9im33midI7xT8WAgjQehlv0rpuDeM
	Y9+cVUKYjwt9wzisBWv75v1ETx6etIGKNE6eN8sFG5rL9Jji2EpcnQXqkK2SZE18H563
	l+Cv51ZJ0CzVnoDtvbeoBAOMxytoZ55qw+czsnMjLtpacx8ufNJ7oZyf7f/zmr2BJrgl
	sBHw==
X-Gm-Message-State: ALyK8tJypDSVwsDkAwl9L/F0HGvH0trlatbMHY7XT9cm1xfQK5CPjc2UJzmu41MyhHerMn7yaslIdI5PSYGk5Q==
X-Received: by 10.157.33.132 with SMTP id s4mr2139467otb.61.1465384519028;
	Wed, 08 Jun 2016 04:15:19 -0700 (PDT)
MIME-Version: 1.0
Sender: seb.salmhofer@gmail.com
Received: by 10.182.231.193 with HTTP; Wed, 8 Jun 2016 04:15:18 -0700 (PDT)
From: Sebastian Salmhofer <sebastian@salmhofer.cc>
Date: Wed, 8 Jun 2016 13:15:18 +0200
X-Google-Sender-Auth: QZbuuJOrwHIQ8MyIEZFq7c27vCg
Message-ID: <CAH4iwCpOr3Hfm1nSQoPQbYHPywXgRXb03XniQWC=F=yFpSOYOw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Beaglebone Black device tree
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
X-List-Received-Date: Wed, 08 Jun 2016 11:15:26 -0000
Content-Type: multipart/alternative; boundary=001a114709aeb7579d0534c26bfa

--001a114709aeb7579d0534c26bfa
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to add support for a lcd display to my build for the beaglebone
black development board. As far as I know, I can change the pin
configuration and settings for the on-chip lcd controller by editing the
source of the .dtb file, which should be a .dts file. My problem is I can't
find this file. There are some .dtsi files, but they don't seem to be the
ones I need, or even used for the beaglebone machine.
Could you please help me where to find or get this file, or lead me to the
correct way to do this if I am completely off.

Thanks in advance and
best regards


Sebastian Salmhofer

--001a114709aeb7579d0534c26bfa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to add support for a lc=
d display to my build for the beaglebone black development board. As far as=
 I know, I can change the pin configuration and settings for the on-chip lc=
d controller by editing the source of the .dtb file, which should be a .dts=
 file. My problem is I can&#39;t find this file. There are some .dtsi files=
, but they don&#39;t seem to be the ones I need, or even used for the beagl=
ebone machine.</div><div>Could you please help me where to find or get this=
 file, or lead me to the correct way to do this if I am completely off.</di=
v><div><br></div><div>Thanks in advance and</div><div>best regards</div><di=
v><br></div><div><br></div><div>Sebastian Salmhofer</div><div><br></div></d=
iv>

--001a114709aeb7579d0534c26bfa--
