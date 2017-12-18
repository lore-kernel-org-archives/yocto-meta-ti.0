Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A85DE00D6B; Mon, 18 Dec 2017 08:59:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FB59E00CFF
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 08:59:29 -0800 (PST)
Received: by mail-it0-f52.google.com with SMTP id x28so29160068ita.0
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 08:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Y/VAlfAUHCIh2BuLhGolnsYS97rCoZ5e405haH8X4yw=;
	b=XlR0uICJKtWgX/LvXjPkF9EMk6G1Ixb8rhVRzfFlilP4voeH9ACIAhJVeXyGIhTS6i
	0dhjk1h2Tq0J7tVYPmElOVs5s7BhAgL/uxoBgVoPiIqQBgqOtVL94OW2mB1u0Rw8W/MH
	fcdx9uu4yLsozNWdmZFAKDn38SNxBtecx/MkKLet6Lw/YsfmuJa8KJIuYuEDghAB3rXp
	2Qf0pOFAmoRXk3TCMYeHu1Xu+pT68Gbuu0m372B0/byhBm5NQIzBgnQ/TXPcN2htpFrt
	dNN2zuK7Iysq/3qLmhHCNZzHbvbwwrAE59P5jYAtTkhzJWk0K02NjnfZiItChUPsHZcy
	K/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y/VAlfAUHCIh2BuLhGolnsYS97rCoZ5e405haH8X4yw=;
	b=qMYRJHbRhIdAHQ9I0Uc4AT446LrD36YsBq04Y65Sq1/+zkKbCJnCBXbaUU5fyIktGk
	aGuOfKtg4uj7jkPI/kR5i342YZ+gpcXklceFw4EEagFH3n5Envru8cE22noJCExk371l
	MkUXs0glqvQ3kTmKdwYOI08rVdE/tdznLrnnzHdoiLHfdRuRk9+2IBWAQ3csZq4u32/I
	6RSxA8is8IzUjYIyBo7VGWS7wo+ozBzP8l3dMkhfQjYjXz6faVS2Z/LAkNledciTGtFL
	YF1BladCVZopZ7hHzjEY9UjwHS0uQyPt3+sXbuzQaylCSm4kBm7ASKnmU0FXqUkwilNO
	QpCA==
X-Gm-Message-State: AKGB3mLID7ubFtArJKd2o5WYIWm3/zdjW9lbX2uydlLyZxbz9juGydkY
	AS6QEfjJuVXYo5aSDIoEJ4nB7kui
X-Google-Smtp-Source: ACJfBosTDs2J6i/9jV+u+mPKGvk75GCmzVsJYy2xhrfdn4FJV8PReRkkd/HPDz3kRQPkOqjdvI28Ow==
X-Received: by 10.36.2.1 with SMTP id 1mr408658itu.17.1513616368627;
	Mon, 18 Dec 2017 08:59:28 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	139sm2868621itm.2.2017.12.18.08.59.28 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 08:59:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513616367.6502.8.camel@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Date: Mon, 18 Dec 2017 10:59:27 -0600
In-Reply-To: <1513377846.13604.8.camel@gmail.com>
References: <1513377846.13604.8.camel@gmail.com>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Subject: Re: No GLESv1 support on Morty?
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
X-List-Received-Date: Mon, 18 Dec 2017 16:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-12-15 at 16:44 -0600, Joshua Watt wrote:
> Hello,
> 
> I'm attempting to build an application that uses the PVR GLESv1
> libraries (ti-sgx-ddk-um) off of the morty branch. However, it
> appears
> that when I call  eglGetConfigs(), it doesn not return any GLESv1
> compatible configs, and so eglChooseConfigs() failes to find one that
> works. I have printed out the configs that are returned and it looks
> like all of them are GLESv2 only:
> 
> Config 0x1:                       
>         color=8,8,8               
>         alpha=8                   
>         depth=24                  
>         type=(0x4) GLESv2         
> Config 0x2:                       
>         color=8,8,8               
>         alpha=8                   
>         depth=0                   
>         type=(0x4) GLESv2         
> Config 0x3:                       
>         color=8,8,8               
>         alpha=8                   
>         depth=24                  
>         type=(0x4) GLESv2         
> Config 0x4:                       
>         color=8,8,8               
>         alpha=0                   
>         depth=24                  
>         type=(0x4) GLESv2         
> Config 0x5:                       
>         color=8,8,8               
>         alpha=0                   
>         depth=0                   
>         type=(0x4) GLESv2         
> Config 0x6:                       
>         color=8,8,8               
>         alpha=0                   
>         depth=24                  
>         type=(0x4) GLESv2         
> Config 0x7:                       
>         color=5,6,5               
>         alpha=0                   
>         depth=24                  
>         type=(0x4) GLESv2         
> Config 0x8:                       
>         color=5,6,5               
>         alpha=0                   
>         depth=0                   
>         type=(0x4) GLESv2         
> Config 0x9:                       
>         color=5,6,5               
>         alpha=0                   
>         depth=24                  
>         type=(0x4) GLESv2
> 
> I made sure I was linking against libGLES_CM and libEGL (but *not*
> libGLESv2). I beleive this same code worked on the daisy branch.
> 
> Is there something I'm missing to enable GLESv1 support?

I think I figured this out. libGLES_CM.so was missing on the filesystem
(even though the libGLES_CM.so.1 symlink and actualy .so library were
present). Apparently this symlink is required in order for the EGL
implementation to report that it support GLESv1. See:

https://lists.yoctoproject.org/pipermail/meta-ti/2017-December/010565.h
tml

> 
> Thank,
> Joshua Watt

