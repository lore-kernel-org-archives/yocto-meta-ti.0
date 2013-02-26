Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 58F79E002AB
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:04:08 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id k10so4004453iea.19
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FeDuwREhDRHxmTzcIfOQM6T44Tr0mK8+R928y1eqU4Q=;
	b=TfIIhbx+p9EuycKGbbaIlk/hphXRL1rLhTWmSENDMUnzvdPVK6d3Klcw40nRgsl7mB
	Iwf9IdZTH2gojyaqvSuZbC465BSy3oxreQ2VNsyVt+rB7M6jCM8W/2GTLhiTrnBmRUNV
	V7Iz1ROzx2X+a3OrzPLupSyk8F5umgfezCHE9PuBQJPyYQdYpVIm/LdU5QumwY3zg7Nf
	KRRbFQrdejyyUQgNwd1CUI5DmJRVZGlE+jsFg3/wD6vqBpwd/wqjcpk+bSVeWsrsZXAZ
	BpV5lHAXj5m9mkPAEqZultu9rA9pViaW8SSgNVD7PUzBR3ux5ZKF52lcIs2OvHBXgKOn
	bZfA==
X-Received: by 10.50.155.134 with SMTP id vw6mr4910328igb.34.1361858647558;
	Mon, 25 Feb 2013 22:04:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 25 Feb 2013 22:03:37 -0800 (PST)
In-Reply-To: <1361850513-12048-1-git-send-email-denis@denix.org>
References: <1361850513-12048-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2013 22:03:37 -0800
Message-ID: <CAMKF1spWxNHySgdtPGqnWNfJ7y4aH1ZZNkZkt4BjM1x20W6FyA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-omapl138: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 06:04:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 25, 2013 at 7:48 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 0001-arm-fix-builds-with-gcc-4.7.patch

where is this patch in metadata ?

