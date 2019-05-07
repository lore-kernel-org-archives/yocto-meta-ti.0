Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A36DAE00D40; Tue,  7 May 2019 09:52:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (robertcnelson[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 706F2E00B1E;
	Tue,  7 May 2019 09:52:08 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id y10so8443723lji.9;
	Tue, 07 May 2019 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W0mtfzjKgwWV8AWmQC6XWi495MsQeq7nZwf6TPF7YGQ=;
	b=o4D9r34nymQnfY8mmXJdt+kHi6xWP4Qemv3FMmfU5yfGb+HmfymSsKgvyOSkr0AncL
	47IzzOwtA/04qFOflz9JaGQSjiRrmFDmBjPqFXy+CZz1Bx9V0C3M1qO1uaLsXC931d71
	KUCg92P52LSY+aXY3eBOhp43JdyAMj37e+Lycq93zYY0GCZbmZSzQ9lWxGPEndA3aBAE
	dhFW82WAfJP6bpQ3fGJ1z1viUM1wCKeIAGopNWNKtQzXOFrMgzC0reVX6f2vTqJfLLGy
	cjMIBRy1AcnEZPLoCVq1181nQJWz3GNbvkI/BmuReh50e/0EuJk7OnQBXAAi5StH5B4q
	StWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W0mtfzjKgwWV8AWmQC6XWi495MsQeq7nZwf6TPF7YGQ=;
	b=S7IsSbXEeQFiIM+k0BtgqwN6vRic5zTBmKtpQlgeU6xC0h0IrIX2E8zDPLyR41EVX/
	yNculD4vqrdoqPBn8HJu4DfiLMZjG/hWBAxW5qJ59DoeJBM9tgOxjpvz4LihfDlrn+Nd
	vIghqOX0+hAicPajgkiGK5deOK3knLI43Pb+4ztnqEgSdAVfaIdkpb3Zquy9k7S7lD4L
	j545bA8a/xtgWWvztvkCoAYiCLike/unbcf4zeevu0BwolQ9Iy0gGqRJp88HiWFxbYTW
	XEDa8jh1jJh8AYerDFEjq/0K1aUhdZxKqQ3PUKlNnoNhrRPAZpWuD7CymlP9e/RWXtJS
	OBeA==
X-Gm-Message-State: APjAAAVGS46yPkQX2GgJVqyS78IZOGFoZiHhsaU8LnOnwzyTQcAC5+nm
	L8TUz7I0+YUsdoDq4kTtigF2EzY+qiJQxyZkTVu00ypE
X-Google-Smtp-Source: APXvYqwt+IYbQuNxW2zQYMwsoT7VqTZXX5/OAAYaYiAItIDUkdkhDERpgFCoxJKq+s8/ZfVyN3IOy5B0WQPuwiBaljE=
X-Received: by 2002:a2e:8018:: with SMTP id j24mr14610459ljg.149.1557247927113;
	Tue, 07 May 2019 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOe0dAV0D78sfX7W_Ge-5be8oo+W47knZAWUoTbeojqa-ezTaQ@mail.gmail.com>
In-Reply-To: <CAOe0dAV0D78sfX7W_Ge-5be8oo+W47knZAWUoTbeojqa-ezTaQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 7 May 2019 11:51:41 -0500
Message-ID: <CAOCHtYhu+Fkvvi4zADPWXoYcfUQF1GQ--SXNtdOOWqo0Xp_0Sg@mail.gmail.com>
To: AshishKumar Mishra <ashish.emailaddress@gmail.com>
Cc: meta-ti@yoctoproject.org, linux-yocto@yoctoproject.org
Subject: Re: Meta-yocto-bsp fails to boot with META-TI [ Yocto-2.6.1]
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
X-List-Received-Date: Tue, 07 May 2019 16:52:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 5, 2019 at 9:43 AM AshishKumar Mishra
<ashish.emailaddress@gmail.com> wrote:
>
> Hi All ,
> I am starting to learn Yocto & following the manual from the Yocto website
>
> I have added meta-ti to yocto and create the images
>
> Can team please provide some pointer to resolve the below error
> or let me know if i am doing any thing wong.
>
> When flashed the images on SD card , the uboot is struck with below mentioned error
>
>
> U-Boot#
> U-Boot#
> U-Boot#
> U-Boot SPL 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)
> reading args
> spl_load_image_fat_os: error reading image args, err - -1
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)

Clear out your eMMC, you have a really old build of u-boot installed
to eMMC that is blocking your new image..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

