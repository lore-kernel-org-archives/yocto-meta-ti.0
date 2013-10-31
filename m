Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01A0EE017D2
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 09:50:20 -0700 (PDT)
Received: by mail-ie0-f174.google.com with SMTP id qd12so5339726ieb.19
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TktkusjaG2FcHKneL4BwOtro9QDUsLNc1B1Nr7UZ9M0=;
	b=RzXj9fD5Z+nl2ZgY+9WgPNCYklJCRrMpCTH+bK1g150SMIUlNA9MYF6pltPiKFH+rV
	MJ9YJcGsGvXy1CqkBJksiipbVAhv42LGqLeMzUxP87dQSKUImH9fQAo+HuKOcfVZL5/S
	YHTaSKN57cSXKjvL0MV1K8wdk6zemWCKv/PgX263KjXXPcRvasCWp+oMucSad4nQ38xm
	FzmRbVgvl0g6n24qvr6ESlBCNeFmph5mVgJbmwYobvQziUnm4eQAHDe5+MlCaIlUVQyZ
	HjxSpi855g4+V8WVhJQb6RYMZWVw8Ky+SwTa3YQQYw/+gn7k2J5E4KmQttPkPKHDHKpJ
	HQwQ==
X-Received: by 10.50.22.67 with SMTP id b3mr185311igf.39.1383238219873; Thu,
	31 Oct 2013 09:50:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Thu, 31 Oct 2013 09:49:49 -0700 (PDT)
In-Reply-To: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
References: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2013 09:49:49 -0700
Message-ID: <CAMKF1spv2KN5Udchrm-y5fFxHMJnaSw9YrhVERHB0mPN5JPQsA@mail.gmail.com>
To: Kai <skmaillist@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Compile kernel with 4.8 toolchain
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
X-List-Received-Date: Thu, 31 Oct 2013 16:50:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 31, 2013 at 12:02 AM, Kai <skmaillist@gmail.com> wrote:
> I am trying to compile linux-ti-glsdk kenel with Linaro 4.8 cross compile
> toolchain, but it cannot boot on OMAP5432 EVM board, no any log from serial
> port, 4.7 version toolchain is OK. Who has been succeeded with building
> glsdk kernel with 4.8 Linaro toolchain?

Try backporting some of the patches that we did for beagleboard

https://github.com/koenkooi/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b

