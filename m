Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 598D0E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:53:13 -0800 (PST)
Received: by mail-ie0-f171.google.com with SMTP id 10so4091618ied.16
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Brs8bvmkRuEbnZOHdf2I6u2WbaVRnb+rVjMDy42BGYU=;
	b=pcEbRc4JBYhuRGIdYEGqSnvPRoYMVCG8hQISgk1rt+ldYPNhWIumlQcAW+ZuHSAssG
	T1JOR/0nyj2XHhFJVKgp6Z+Pw6ppbVIK4r/BzKqbYEBOPb/p1HJfo8jcwIFqT2OxLk6Y
	lrYJvnJ60BabAzgxwoPMH2rOZ0GtyG1JVXxUqdmxbyakfM80SHqAhW6iPj7RgasOEHx9
	1hvb1fCk7iOfSWp/GBnJAqz2LeOvLXMff5P9sUK6DezyhOxATGpPtd5Td3RWW9bGTlKs
	OxwEZW5xCj/uRdqCHIx9fakNRXkCB9Ywu5KmuuYoPgbEoWZZvJwz8djRyqxhs2KnkT5q
	WIPw==
X-Received: by 10.42.121.14 with SMTP id h14mr5737613icr.27.1361861592816;
	Mon, 25 Feb 2013 22:53:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 25 Feb 2013 22:52:42 -0800 (PST)
In-Reply-To: <20130226062803.GH6725@denix.org>
References: <1361853748-24166-1-git-send-email-denis@denix.org>
	<CAMKF1soyC8T4jau0jWrEHoGD_+OcpUBV3KtUeh5tT1OaHONemA@mail.gmail.com>
	<20130226062803.GH6725@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2013 22:52:42 -0800
Message-ID: <CAMKF1sqiAL=RF6r3k7aAuUYeOVE3dTnizpLdkS_XD0ESNkfyYg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv2] linux-omap-psp: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 06:53:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 25, 2013 at 10:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>
> We have at least 3 kernel recipes of 2.6.37 version, hence the common location
> for this patch. I don't plan on updating older kernels to work with gcc-4.7.

it depends on how its all organised. In my view something in files/
applies to all recipes under that dir
and then you have ${PN} and ${PN}-${PV} and so on to make it more and
more specific. On another extreme you can also have a flat
structure if you dont have conflicting patches. As it seems you have
something in the middle

