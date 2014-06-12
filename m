Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37851E00BDF; Thu, 12 Jun 2014 16:10:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.128.170 listed in list.dnswl.org]
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4873BE00B66
	for <meta-ti@yoctoproject.org>; Thu, 12 Jun 2014 16:10:16 -0700 (PDT)
Received: by mail-ve0-f170.google.com with SMTP id oz11so2556061veb.1
	for <meta-ti@yoctoproject.org>; Thu, 12 Jun 2014 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=d/bXWCfOScxwF8BFdwYgW+SyiE8xs2Y5/8bWi0LbfDg=;
	b=yUdA9LUBsoh9lxfMJ1dYHNTj7EYuEj/ZPiASKWmRWVUG3gG1R/SFqSRVi/VXP6Zmgx
	YM5CmFsgClWIICKIbtzX8KHSw7p+aSOCJX5pPJv0kFCLgDwkJpewZV5yDAD5VEMq3aMY
	JIByk2Tykf1kV3AAweWxaTh3QvqVCYd6NoGXYvR55pcMYCVxADdEEgchmhgyyD09pofi
	HWP0cqE0EgSS5F3nHlk/0pOu98oMgY8TTqnBBdw35FPXQK1XncsznaoebkSLPP/bbGhA
	G/UvUcO8gFeaYO3Hb7tGThd5pW7xBxhYYxLAcKwRmhkBJYKuRZ0gdXWl+4UNgsT/iNhp
	vQIQ==
X-Received: by 10.220.182.5 with SMTP id ca5mr23665vcb.50.1402614615535; Thu,
	12 Jun 2014 16:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.196.229 with HTTP; Thu, 12 Jun 2014 16:09:45 -0700 (PDT)
In-Reply-To: <CA+2YH7vFhA8y4e6Jyb-mrQtxr_3Ad11utaq8EsmNHa_AiyKNqg@mail.gmail.com>
References: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
	<20140611025637.GK18034@edge>
	<CAK8F28khwqPSrfonrhqWDDe=_=Mn1602z8w-h3EYV9x_3oU4-g@mail.gmail.com>
	<CA+2YH7vFhA8y4e6Jyb-mrQtxr_3Ad11utaq8EsmNHa_AiyKNqg@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 12 Jun 2014 16:09:45 -0700
Message-ID: <CAK8F28==cQTSqjy+hg2VZX_6q4RcPHBUJzKwRFTYbRR6AnWfUw@mail.gmail.com>
To: Enrico <ebutera@users.sourceforge.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: DSP packages for OMAP3
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
X-List-Received-Date: Thu, 12 Jun 2014 23:10:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 11, 2014 at 7:35 AM, Enrico <ebutera@users.sourceforge.net> wrote:
> If you have no specific reason to update the CGT you will just waste
> your time, it's a miracle that it's still working as it is...infact
> i'm using it so i can say that it works.
I had to make a few patches to get gstreamer-ti and friends to compile
with yocto-master.  Send patches to meta-ti?
>
> Unfortunately the libraries are only soft float, so no hard float
> support. The problem is not in the makefiles (well maybe some patching
> is needed), you will just get link errors.
What packages actually contained pre-built binaries?  I see a bunch of
arm binaries with the extension .xv5T but I've been struggling to
figure out what binaries are pre-compiled.

--Ash

