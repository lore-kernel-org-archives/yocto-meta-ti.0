Return-Path: <gizero@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D533E00BF8; Mon,  4 Apr 2016 02:59:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (gizero[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5907E00B6F
	for <meta-ti@yoctoproject.org>; Mon,  4 Apr 2016 02:58:58 -0700 (PDT)
Received: by mail-qg0-f46.google.com with SMTP id j35so144520829qge.0
	for <meta-ti@yoctoproject.org>; Mon, 04 Apr 2016 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=l3Hqa6Hz6qusj/mPY96c8Bb3aNfnzat/Fy3MOq9bBl8=;
	b=ezLynssPss+jIHLb8m9NsNPoRVPfkiUzE93GU08pLWizVJAErbAH0U9wskFd2uVt6a
	ZVP6k/mMXYU8RvVp80sYjuQ/UcK5+5gga3L3VisWQMB6L5UTLAIy09X0Vb7/yUWGAgAU
	2uk5YJG31MNf60Z57zQXSq27cJ1o6MrankyFbf2B5RWLL/ptgsGoyTlxHYxCKK3skHIW
	P+/5KnylTmMd7+1/l0u8YsGvk2mVMRjrudC0UyhuOnO3WjM0T3MLJl327ssM5ptSxxvn
	ih+ZMQkmoeohA7uYT9HI4tyMx9Rb7Jk0kDDqtlUVSXUDDGOGQUFv0ZIcBOwEmlWsM8ji
	xp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=l3Hqa6Hz6qusj/mPY96c8Bb3aNfnzat/Fy3MOq9bBl8=;
	b=XNCNb6ffbTpa5JZzsx3y9/JGsMBFjNfsbF03jjeuMDcTZ2bEkdndawZGErP7Al+Ap/
	hSmkvKAvftQX+OAT9VQrEiUZYeWHiCjmP5OXtPEj4XJXN70URqlWPFDCGVfYH6BrtHCA
	BwFoFykIANv8kd2hOoYeGUo0wahfZbOR0MYQPrAZ+9SOQc0eqXIIwEq6xnBBwQ6LzyEU
	nHIiBoLjKQfxWeT+deuc9D4fDsYowsESHzcBxf4+HIO7mN1cGo2sykuP6W4MxLtkBNj9
	LkzWgpykaIcZJU0+P+3b7YRriuIfRsDvA74fsoDyVauIbJa/ryz4Ygg5v1vg/w4x3/bl
	kyUw==
X-Gm-Message-State: AD7BkJI439j0z6B3EplNXrG6nbxnSLHRwZEpqoubBBrnvcYR8GPBmqLVqkTdBrN0SnUwnAiU6FHmcfT9cFZ5Dg==
MIME-Version: 1.0
X-Received: by 10.194.60.165 with SMTP id i5mr18622994wjr.178.1459763937687;
	Mon, 04 Apr 2016 02:58:57 -0700 (PDT)
Received: by 10.194.54.162 with HTTP; Mon, 4 Apr 2016 02:58:57 -0700 (PDT)
In-Reply-To: <20160401184034.BB0ED529EF@arago-project.org>
References: <20160401184034.BB0ED529EF@arago-project.org>
Date: Mon, 4 Apr 2016 11:58:57 +0200
Message-ID: <CAC+thW1YUq9_xg2ubfhu2Yb+dcwTSnwTVrVj9_GGY=SwM1Q3hA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: Arago Project git <git@arago-project.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Denys Dmytriyenko : linux: remove old and outdated kernel recipes and configs
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
X-List-Received-Date: Mon, 04 Apr 2016 09:59:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri, Apr 1, 2016 at 8:40 PM, Arago Project git <git@arago-project.org> wrote:
> Module: meta-ti
> Branch: master
> Commit: 8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
>
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Thu Mar 31 21:53:58 2016 +0000
>
> linux: remove old and outdated kernel recipes and configs

This patch seems to break the build at least for some machines, which
still prefer such outdated kernel recipes. This is the case i.e. for
those machines that include either conf/machine/include/davinci.inc or
conf/machine/include/omap3.inc. Just noticed it while trying to build
a basic image for omap-l138 for a possible revamp of an old
arago-based project. What are the plans for those machine? Are they in
the way to be dropped? What's the suggested layer stack to start from
for a "modern" system for an l138 system?

>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>  recipes-kernel/linux/linux-keystone-3.13/defconfig |    1 -
>  recipes-kernel/linux/linux-keystone-rt/defconfig   |    1 -
>  recipes-kernel/linux/linux-keystone-rt_3.10.bb     |   33 -----
>  recipes-kernel/linux/linux-keystone/defconfig      |    1 -
>  recipes-kernel/linux/linux-keystone_3.10.bb        |   33 -----
>  recipes-kernel/linux/linux-keystone_3.13.bb        |   34 -----
>  recipes-kernel/linux/linux-mainline/defconfig      |    1 -
>  recipes-kernel/linux/linux-mainline_3.14.bb        |   41 ------
>  recipes-kernel/linux/linux-ti-glsdk/defconfig      |    1 -
>  recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |   32 -----
>  .../linux/linux-ti-staging-3.14/configs/systest    |    1 -
>  .../linux/linux-ti-staging-3.14/defconfig          |    1 -
>  recipes-kernel/linux/linux-ti-staging_3.14.bb      |   67 ----------
>  recipes-kernel/linux/multi-kernel.inc              |  140 --------------------
>  .../linux/sitara-linux-ti-staging-3.14/defconfig   |    1 -
>  .../linux/sitara-linux-ti-staging_3.14.bb          |   51 -------
>  16 files changed, 0 insertions(+), 439 deletions(-)
>
> Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8bb3fd849c8a43a9f9a4b26b820fd8553e01e0c7
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

