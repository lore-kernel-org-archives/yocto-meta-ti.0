Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B670BE00970; Sat, 18 Mar 2017 03:54:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B6AFE003C1
	for <meta-ti@yoctoproject.org>; Sat, 18 Mar 2017 03:54:20 -0700 (PDT)
Received: by mail-wr0-f169.google.com with SMTP id u48so65738875wrc.0
	for <meta-ti@yoctoproject.org>; Sat, 18 Mar 2017 03:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=WVfu4QEM0/cX/FoDvqEJQOBRCMBBikklkEotz2uA1WE=;
	b=SadEhdaD5VTc2mM7KvCL3z44Ck7jUsNI3Dzs61E9Kxoxffx00QMByhN+ZVIQJ/1Yhn
	d829JFxfOa327eqGHg8sjBQSpmbSFKQcoegYc2y6A0iKq7U0PVOlOFypwAF/3VY1Y2h8
	FP1GzU2Y+FRw6BxULKhKKWSFHKxZAvssaK8Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=WVfu4QEM0/cX/FoDvqEJQOBRCMBBikklkEotz2uA1WE=;
	b=UjHWtggLToPck8wgitp9rZLMh/LX0S9H2v8TfpnXNlfUYcQZKEm1vWeGwN6kVPDN5E
	hlmwcM/6NSpTdB/f2YSrzaWn+fqPkq52MqSVNH6BiPbfMuI4kg33w1GNoSfPBvoOyKnv
	5Iw2Iss2U8tYPoTG90FlIke5sSx8dLknI74FP9wqx06S27OwQ6XOX+y7iE1sHzeRUtuR
	rErgIF5wC1TlOipI7JzCCae2het8mbJ2W2r14PvOrLl+zDyryAXq7IG1AZ8rSE784Xuc
	fl0BE0418pT5bCA3OTtasUKXkTEjLYWzhB3GE/ygunPiDBIT4R7rNyRRv3PayWGDTzoI
	oUKA==
X-Gm-Message-State: AFeK/H3M4gb533r2NKjCsITiNZDKn3Yesoj2L8Fw1Xhk5nwBjgioAHdCuR6QjwoHMqzrMig1FmKKnwyY2ou0+4EQ
X-Received: by 10.223.174.164 with SMTP id y33mr16852786wrc.166.1489834459937; 
	Sat, 18 Mar 2017 03:54:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Sat, 18 Mar 2017 03:54:19 -0700 (PDT)
In-Reply-To: <20170318083941.21353-1-fathi.boudra@linaro.org>
References: <20170318083941.21353-1-fathi.boudra@linaro.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Sat, 18 Mar 2017 12:54:19 +0200
Message-ID: <CAGNsrLBPd+GbhFJbmLvOqALk99uc3ihtSCQjAJy_5E19DZwA8Q@mail.gmail.com>
To: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [morty-next][PATCH] kselftests: add bash/ncurses runtime dependency for futex test
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
X-List-Received-Date: Sat, 18 Mar 2017 10:54:24 -0000
Content-Type: text/plain; charset=UTF-8

sorry, resent by mistake.

On 18 March 2017 at 10:39, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> futex test requires tput at runtime.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-kernel/kselftests/kselftests_4.9.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
> index 3cd12ea6..6e8c2143 100644
> --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
> @@ -142,6 +142,7 @@ FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>
>  RDEPENDS_${PN}-cpu-hotplug += "bash"
>  RDEPENDS_${PN}-efivarfs += "bash"
> +RDEPENDS_${PN}-futex += "bash ncurses"
>  RDEPENDS_${PN}-memory-hotplug += "bash"
>  RDEPENDS_${PN}-net += "bash"
>  RDEPENDS_${PN}-vm += "bash"
> --
> 2.11.0
>

