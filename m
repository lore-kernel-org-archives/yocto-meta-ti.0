Return-Path: <nicolas.dechesne@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1852AE0078E; Mon,  4 Aug 2014 16:24:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.219.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8DD3E004DD
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 16:24:39 -0700 (PDT)
Received: by mail-oa0-f49.google.com with SMTP id eb12so104298oac.36
	for <meta-ti@yoctoproject.org>; Mon, 04 Aug 2014 16:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xq6QisrAzCww0byvwC9Lq1EjcrEDf7CRXGJN/umfaGk=;
	b=OfYHkr1vPv5JL+eM0sXpht9C90CNXAGGveaK0jUL+tiu7CIwguDMRRBJijRguwplpX
	UF8pEu1LjgEZPu7RSE6YxyzU3RAjUPv9lFuIjo0Q/ema9Fwr1y8DKPmTvAlhoy5SL7gu
	qt/2rTQUxZdCopoWY6Sn3tthuZ1/8fFfT5TAEfekN56uHL0xVUTA/h/sLPf60x7FJEqO
	LijJLLR2Wzt+xalEFWmBmgnek4J2Nhe+2rTdwMIhtVG40Di1/hUwOyEbSIpGccuJBdYy
	APnSToWJL+aMTtMfKLqZVhBgj3fahrmtI+DWfd8RT49Um7XEDZlZaLaaFSSlMJQhecBM
	vogA==
X-Gm-Message-State: ALoCoQm5ieKC5GvOh/BzCo+wv2QxoRGz4FD87EaQgo//VudG8zxmExICYma328+EKFeO87Gr5znz
X-Received: by 10.182.142.40 with SMTP id rt8mr9046288obb.80.1407194678898;
	Mon, 04 Aug 2014 16:24:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.171.168 with HTTP; Mon, 4 Aug 2014 16:24:18 -0700 (PDT)
In-Reply-To: <1406684113-18232-1-git-send-email-denis@denix.org>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 5 Aug 2014 01:24:18 +0200
Message-ID: <CAP71WjwdFhrz=c-RJHyte7vLRVSex1DxBX=4nR7DHJVHY64BXA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Mon, 04 Aug 2014 23:24:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed, Jul 30, 2014 at 3:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> index b505640..c223c88 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -3,8 +3,6 @@ DESCRIPTION = "Linux kernel for TI devices"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
> -DEFAULT_PREFERENCE = "-1"
> -

i just noticed this change ^^. Was this intentional? This is a big
change which could have been in its own commit, or at least should
have been mentioned in the commit log... as it is it was lost in the
noise..

cheers
nico

