Return-Path: <maciej.borzecki@rndity.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EF15E00C29; Sun,  9 Jul 2017 23:25:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.182 listed in list.dnswl.org]
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2309DE00C1C
	for <meta-ti@yoctoproject.org>; Sun,  9 Jul 2017 23:25:13 -0700 (PDT)
Received: by mail-wr0-f182.google.com with SMTP id r103so124102964wrb.0
	for <meta-ti@yoctoproject.org>; Sun, 09 Jul 2017 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kSelAwSvfAqNrXilKyc5eOrZFq2Q6FxlE98nIG98Ciw=;
	b=n9DV9J4sLEE732cXg4tOk2z6KN+Tl916BbuUqFUBdxVPBgYml0+E47N4n1PovkDP/i
	FY67GY/vy2trF6UfYD48X7xNGMPW8r89zaEm/neU5q97TRwIaa5g28kNr3yrcMy0xhRs
	PEh630UbBBmhW390fZh9jYGIc1tJL4IM02fThrQ/M8/izOm9QprgOu87PKs2XcV3PlBf
	VE75k9CUL6HCIkdOSkNrCc6SbUpE1UjzufH65POoJ3zrmHLWfmBAgh6L156/sHtP0oRT
	TbmpjREzRpIwCz8iPnaWdJuGHUXXhgVaal7YXuXIBvOw2+uKu6m0ssQWgII4b5laobwG
	0iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kSelAwSvfAqNrXilKyc5eOrZFq2Q6FxlE98nIG98Ciw=;
	b=eySaCXqJy6IUM1zOtzLcO7pZlt70ZSATVY+BndQHhGaaHL/jYQ4k2amj0koM+wNs5e
	gqdYffhacOW7lYE2i1HqnctlDYQExJMfpiTgsIhJl9JR3/g01p/1OrdSrQQcULvNI3qN
	nhlX1F2Nv1gdEVHXPOivcOJiqxyXaFd9Xv7vD1zBIuCeB0ZNE5tYTy73rI9xHKuDnikO
	Xvh4a0wwzHe9VVtQUcB72BtsFUovFdMzCu5sk/rAMmAOKSnr260x7KfIZby7PKUqw/k5
	1QgnAUVmDZIM8n2rnEFqtyd1I3fE5l3vtff+QTnI7qoqAYnR3cM+A+92tCLDO/yGVdJs
	rhuw==
X-Gm-Message-State: AIVw110WSdAAnIw6Qeds0n4HxcWSYLkSwdE5EVGcDaFu4ynQdvSulh2Z
	RdvrEA/7+ck2xrUGGJy8gWH55iUtYDEW1Pg=
X-Received: by 10.223.163.15 with SMTP id c15mr6765338wrb.71.1499667912762;
	Sun, 09 Jul 2017 23:25:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.58.136 with HTTP; Sun, 9 Jul 2017 23:24:52 -0700 (PDT)
In-Reply-To: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
References: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 10 Jul 2017 08:24:52 +0200
Message-ID: <CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com>
To: Riko Ho <antonius.riko@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: HDMI and Wifi USB dongle ?
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
X-List-Received-Date: Mon, 10 Jul 2017 06:25:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 6:31 AM, Riko Ho <antonius.riko@gmail.com> wrote:
> Dear Meta-TI Members,
>
> How can I fix the current issue between HDMI port and Wifi on USB dongle ?
>
> Everytime I put HDMI, my USB dongle is down ??

I would start by trying to use a decent power supply.


-- 
Maciej Borzecki
RnDity

