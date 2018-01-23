Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B8C2E00E11; Tue, 23 Jan 2018 09:08:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83208E00D6D
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 09:07:59 -0800 (PST)
Received: by mail-yw0-f170.google.com with SMTP id v139so442808ywg.4
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 09:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ull/xfcI0ugN9TGnjibjh8wTfoNSxbNjpy2JMLkzl4A=;
	b=VubBwpbIXQ5uwCJ6f4WMoQYBDraNVhJOxaJpbzb6P5K7jr+QDyQ6+aR/dR0Iqlo1Fn
	pcKAkcHC2DNHq9u9vVPVCbUZp/z2UGFo3W/uSlEC4ZzJTxqe16S14FiHEHXvWzTk5MIE
	PmlNx7OOsTipFQ8Q0MXKfz1BmJHhLkJryp03HLMVmnGx4o4jWs3aQMyV+/cv+WZU3csz
	lE2UfI+PHAZTzgMj7JhiSTFxNzg1mz5zIuHHNS/WcIgyOmDLVgJu+KQMSlhlLfA1y+A5
	HjUAk/5KDdzAwscOvHXtgR0RZzHhiGCYyR1DHi0NTj7db8SOGXLkGybiiYrfPIckXLjD
	U3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ull/xfcI0ugN9TGnjibjh8wTfoNSxbNjpy2JMLkzl4A=;
	b=WGWzO1yVHfy+dns74kHzMFVtG8guY68qzFL14dkjWWhGrvoZfZL38uhTsJlTgLZyqR
	SJFOcqzWZT4mo8T+/GF2abb6okbT0RmSynk7B0uTqwW2sIq9DyE0DuRDD7wC/dezSa/e
	kF0g/c5l90Df3w2/F1qsSKC0kwYB7tKA+CW38l233PXgMT7TEH+XhVoDo3I63z+yMB2q
	unVctX06+BKT1oj5jhgpZTVHGGfZ2FHgzambyE0174saHBRQiyyIohQoW2RFf1eKkzpR
	UqfJlBUhth5DtANXS7XOGIr/qntpfdtheL75eJNl7zEs4w2GcAB+HTbXeUbDhXlOCXAV
	S0kQ==
X-Gm-Message-State: AKwxytd6Q4bYsNL56coWDfQUjPb5tn+ARmxlqn7e3FcIiBZZMiKH5Wi7
	gyC+ygj18disrSqaWEgCCYKSicgCO3AOa0WeptI=
X-Google-Smtp-Source: AH8x224YlfIw7vAVLEMdiylMk0ac+XJb27IhUsui33OnzyShIxQneXJqs/yO5Z12AwZF95/w4ekwdxvmsUJgeeBXWKg=
X-Received: by 10.129.138.197 with SMTP id a188mr3090803ywg.88.1516727278363; 
	Tue, 23 Jan 2018 09:07:58 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 23 Jan 2018 17:07:47 +0000
Message-ID: <CAFeBWL7GVq8CqHvL-0DGghis1YGNBBByMhxYybhF+mFggGrajw@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: wayland-ivi-extension 2.0 support
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
X-List-Received-Date: Tue, 23 Jan 2018 17:08:00 -0000
Content-Type: multipart/alternative; boundary="94eb2c080808a5eaea056374963c"

--94eb2c080808a5eaea056374963c
Content-Type: text/plain; charset="UTF-8"

Is there a plan on updating wayland-ivi-extension to 2.0 from 1.11?
My build based on Rocko is failing because wayland-ivi-extension 1.11 is
failing due to updated API [1] [2].

Thank you,

Adam

[1]
https://github.com/GENIVI/wayland-ivi-extension/blob/57113312ac6e57401433bd6ebda11a19ecba3961/weston-ivi-shell/src/ivi-controller.c#L2136
[2]
https://github.com/GENIVI/wayland-ivi-extension/blob/ede33c1c898eeaf673dd2c275e92763a5aabd066/weston-ivi-shell/src/ivi-controller.c#L1485

--94eb2c080808a5eaea056374963c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there a plan on updating wayland-ivi-extension to 2.0 f=
rom 1.11?<div>My build based on Rocko is failing because wayland-ivi-extens=
ion 1.11 is failing due to updated API [1] [2].</div><div><br></div><div>Th=
ank you,</div><div><br></div><div>Adam</div><div><br></div><div>[1] <a href=
=3D"https://github.com/GENIVI/wayland-ivi-extension/blob/57113312ac6e574014=
33bd6ebda11a19ecba3961/weston-ivi-shell/src/ivi-controller.c#L2136">https:/=
/github.com/GENIVI/wayland-ivi-extension/blob/57113312ac6e57401433bd6ebda11=
a19ecba3961/weston-ivi-shell/src/ivi-controller.c#L2136</a></div><div>[2]=
=C2=A0<a href=3D"https://github.com/GENIVI/wayland-ivi-extension/blob/ede33=
c1c898eeaf673dd2c275e92763a5aabd066/weston-ivi-shell/src/ivi-controller.c#L=
1485">https://github.com/GENIVI/wayland-ivi-extension/blob/ede33c1c898eeaf6=
73dd2c275e92763a5aabd066/weston-ivi-shell/src/ivi-controller.c#L1485</a></d=
iv></div>

--94eb2c080808a5eaea056374963c--
