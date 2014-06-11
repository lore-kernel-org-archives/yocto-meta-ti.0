Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55A13E00BC3; Wed, 11 Jun 2014 07:35:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.1 DKIM_SIGNED Message has a DKIM or DK signature,
	not necessarily *      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.180 listed in list.dnswl.org]
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 256F2E00BC1
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 07:35:52 -0700 (PDT)
Received: by mail-ob0-f180.google.com with SMTP id vb8so5237144obc.39
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SMCmXx4Tmk3YKvlg1ihB/vq4vPnYhBwl05U/LxHP4pQ=;
	b=z1vYkVYBt0/5bI8yrTeZzTMn56x9/bEX6q/NARUR98AJVkPG22RHA0KKEhRUTI1/+z
	HT5pFc2Mzc3VJ7ujbJBBbYWd8n/GBtCJ6UYeFwurijmM0q5FqyUCAi9dip4WIPiLRnTa
	7wSy8x7vzkQnaV8d00fBVr/hq8QHBXkRA4wo1M9tX/TIypEct8taPbz7J4qBoyuZNo9y
	RmPiYPDluQMxgeLtIDgBKfCPTkt0aegYYaRsdilAI5GgJT+Mq6CSXv2EMgoqTxm4sxwm
	/q/sJIt5SQDvAecZmzFhPyQz59kwSsm2r/L3YzJTX5/1P2gdhT8VpJ8RP2vGkCgFwfKT
	GvAQ==
MIME-Version: 1.0
X-Received: by 10.60.45.130 with SMTP id n2mr40376517oem.12.1402497352032;
	Wed, 11 Jun 2014 07:35:52 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.182.159.106 with HTTP; Wed, 11 Jun 2014 07:35:51 -0700 (PDT)
In-Reply-To: <CAK8F28khwqPSrfonrhqWDDe=_=Mn1602z8w-h3EYV9x_3oU4-g@mail.gmail.com>
References: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
	<20140611025637.GK18034@edge>
	<CAK8F28khwqPSrfonrhqWDDe=_=Mn1602z8w-h3EYV9x_3oU4-g@mail.gmail.com>
Date: Wed, 11 Jun 2014 16:35:51 +0200
X-Google-Sender-Auth: V7JeWihPDak76IFOgEmvaVZXl-c
Message-ID: <CA+2YH7vFhA8y4e6Jyb-mrQtxr_3Ad11utaq8EsmNHa_AiyKNqg@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Ash Charles <ashcharles@gmail.com>
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
X-List-Received-Date: Wed, 11 Jun 2014 14:35:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 11, 2014 at 10:13 AM, Ash Charles <ashcharles@gmail.com> wrote:
> On Tue, Jun 10, 2014 at 7:56 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> Unfortunately, DSP support in meta-ti is not maintained currently, as
>> explained in the corresponding README file.
> Thanks Denys---I understand the recipes are aging a bit.  I mostly
> trying to  get a handle on what is achievable with the current
> state-of-the-art.  Know of any reason a) not to try with a recent
> version of the CGT b) that hard float can't be used with DSP support
> code?

If you have no specific reason to update the CGT you will just waste
your time, it's a miracle that it's still working as it is...infact
i'm using it so i can say that it works.

Unfortunately the libraries are only soft float, so no hard float
support. The problem is not in the makefiles (well maybe some patching
is needed), you will just get link errors.

Enrico

