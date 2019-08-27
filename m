Return-Path: <r10kindsofpeople@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15A5CE00DAA; Tue, 27 Aug 2019 13:43:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (r10kindsofpeople[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.179 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC95DE009DA
	for <meta-ti@yoctoproject.org>; Tue, 27 Aug 2019 13:43:30 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id g128so355998oib.1
	for <meta-ti@yoctoproject.org>; Tue, 27 Aug 2019 13:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Q+Lu4RH4Q6naxtcMoWC0D6z3msmTXG+23EOh0ZIQ78I=;
	b=jDtWpasZJraOPf7fBgqDWUCbOx724Hu9dP+optcGpXSACVpv5/6jwS6sp2RbPxky/p
	7bI5Vt6WVT1V7hbQLUYV3f2cxZVPMR1sKq955EQmxEWib9pZw7x/anAPBwZ3gZd3HUr2
	rzEZ7r2vYbedK6OOSkBJYrbN1BBh/AsdEfCFWaaGaNxuXyUx8civQjGqw0xd8/Q/Q67Z
	VcGyuAMiP80onRyjQE4sQYV95mqV5jguWz5JmV3JTJ2Q0f92J/yj0ndswQtavNrAJGUc
	vrxPg/9nfffWTaMqapjXPTQNswXAnc/XnwWC0L3g3hqYuXCT/I3RJwHOabRS+ZYWcNb+
	0YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Q+Lu4RH4Q6naxtcMoWC0D6z3msmTXG+23EOh0ZIQ78I=;
	b=YtjxfWueOnV8HRcyEDMyBH3IGthzUsYw8rC/3CXSoJBpUtKzQ0h9/BH7CxVPrNY7Fa
	LXfzx1dc8Rym9H7o+hzP7aLNgnHGwEiPZyzWwjxHXV1alq5u0E2AHAtNns+h9e/IpN5P
	FRxuiS1ntlG8uzCN23QsETgR9Lc4Xuyoy6uJ85QR2EFY5bDieDfgvJofO28TJonaxJvA
	nv/CdkHhw7ZVYDEKDWZOfQdceDevpO+MoBwDDkZjCco037096OiXklzjMmlIOpmSrAmQ
	HBDvwG49zjPWzz3gsmQjD47zD/9a4yGsWe9g/GCSjuilnUnWhmjGfcY8BeKZZbp8plLQ
	DBbA==
X-Gm-Message-State: APjAAAUoVh53wITsSIde7+4Rht+fFzLRq6T/2/Pg4nG6GKO6vSfifGbP
	5VWOe/gjYTtou1b6/vtPef8UYaSR0mc8Th5EPyMgZw==
X-Google-Smtp-Source: APXvYqyefxdFTj0uUvw3lhYygdnW0vHy1CzgYQbfekNL79a2kDc7wgf0GeY77QyLYamV83LCJz1ZZ/SMZBMse2oufXg=
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr463451oia.128.1566938610032; 
	Tue, 27 Aug 2019 13:43:30 -0700 (PDT)
MIME-Version: 1.0
From: r10kindsofpeople <r10kindsofpeople@gmail.com>
Date: Tue, 27 Aug 2019 16:43:19 -0400
Message-ID: <CAE8H0+VA9qgYGAW7nqA4RQB-ejNjuM=J2EGrL3jPAmRYijKnOw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Getting Started/kernel config
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
X-List-Received-Date: Tue, 27 Aug 2019 20:43:33 -0000
Content-Type: multipart/alternative; boundary="0000000000003c629405911f53bd"

--0000000000003c629405911f53bd
Content-Type: text/plain; charset="UTF-8"

Hi,
I've been working with Yocto on various processors including the AM335x
(under Arago and a mfg's BSP) for quite a while now.  But I'm working on a
new project with the Beaglebone Black Wireless.  Downloaded thud, set
machine to to am335x-evm and have a bootable microSD image.  Using
systemd.  Core-image-full-cmdline.

Is there a guide available for working with meta-ti ?  I'm having trouble
understanding the kernel configuration recipes, finding out what the
current configuration is, and how I can modify it.

On the specific problem, I'm trying to enable the usb ethernet gadget and
configure WiFi so I have both options for connecting to the target.  At
some point, I'd like to configure the WiFi as an AP, assuming that's
possible.  There's a few other kernel configurations that I need that seem
to be atypical.

Any pointers would be appreciated.

John

--0000000000003c629405911f53bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I&#39;ve been working with Yocto on various proces=
sors including the AM335x (under Arago and a mfg&#39;s BSP) for quite a whi=
le now.=C2=A0 But I&#39;m working on a new project with the Beaglebone Blac=
k Wireless.=C2=A0 Downloaded thud, set machine to to am335x-evm and have a =
bootable microSD image.=C2=A0 Using systemd.=C2=A0 Core-image-full-cmdline.=
=C2=A0=C2=A0</div><div><br></div><div>Is there a guide available for workin=
g with meta-ti ?=C2=A0 I&#39;m having trouble understanding the kernel conf=
iguration recipes, finding out what the current configuration is, and how I=
 can modify it.=C2=A0=C2=A0</div><div><br></div><div>On the specific proble=
m, I&#39;m trying to enable the usb ethernet gadget and configure WiFi so I=
 have both options for connecting to the target.=C2=A0 At some point, I&#39=
;d like to configure the WiFi as an AP, assuming that&#39;s possible.=C2=A0=
 There&#39;s a few other kernel configurations that I need that seem to be =
atypical.=C2=A0=C2=A0</div><div><br></div><div>Any pointers would be apprec=
iated.</div><div><br></div><div>John</div></div>

--0000000000003c629405911f53bd--
