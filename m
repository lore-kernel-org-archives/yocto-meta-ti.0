Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65EF3E00A73; Wed,  5 Aug 2015 20:00:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.179 listed in list.dnswl.org]
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E28AEE00A53
	for <meta-ti@yoctoproject.org>; Wed,  5 Aug 2015 20:00:48 -0700 (PDT)
Received: by iodd187 with SMTP id d187so68603611iod.2
	for <meta-ti@yoctoproject.org>; Wed, 05 Aug 2015 20:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sBMAnWYBMbDfgaEPM1vnsZUV0h38dSNa+tP2Hp34LSY=;
	b=IMBEcHRe5jO9ZBj8hrPn9VcAClQKM5XwZlFcEz2jdU39mzrCvlf3H0N1uOeeFTX/VT
	CZhputyVZx541ij0CZnd6dklD7Cl3XLz0leSvd8xfIIjhqirMoWTYrmf9HGnAzAFTrnK
	H4UjbooOkMXQvNioIns+VKa4K6ANep7RJrEWz3DxW5ZcRx3XHyGMMFv1iALSOoYqsWz7
	/LkKatGSVNBg0eapBWtGfQ2RJPjtgnnC15zIPvO5lQukyfgJ6+O9vmOly3GcctHs3UxP
	nrUpuvU7ceFLlI6t/Cs1x6UcZcwWyjdm2cq14JLdyNIV8wzPvAmHd3sMP3kzawxFd7Lq
	Um7w==
X-Received: by 10.107.14.203 with SMTP id 194mr15389872ioo.195.1438830047459; 
	Wed, 05 Aug 2015 20:00:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:00:18 -0700 (PDT)
In-Reply-To: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
References: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:00:18 -0700
Message-ID: <CAMKF1soasoTP6wYhC8WDEuBn05ROkCKd_AcaoYGWgM+dEWE_Uw@mail.gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 03:00:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 7:47 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> Hi,
>
> I am using TI AM335x-EVM kit and while building image using
> "arago-daisy-config.txt", I saw this warning :
>
> omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
> omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now
>
> and TUNE_FEATUREis "vfp"
>
> Does that mean GPU is not getting used anymore ?

not really, what its telling is that you dont have
callconvention-hard in TUNE_FEATURES
which means that compiler wont use hardfloat ABI when making function calls.
but neon/vfp will still be used e.g. when doing vectorization etc. if
using hardfp ABI will radically improve performance totally depends
upon kind of workload that you are measuring. It may vary.

> I am using QT5 with eglfs platform and need GPU support for performance.
>
> Please clarify the situation.
>
> Thanks
> Ankur
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

