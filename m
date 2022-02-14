Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.2763.1644879658051151661
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Feb 2022 15:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i0C8KNVV;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id o3so16889506qtm.12
        for <meta-ti@lists.yoctoproject.org>; Mon, 14 Feb 2022 15:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=dzO+8DkoCBA6F9/FgXP2xqMTVHplZdTRr4XXr2DZYjc=;
        b=i0C8KNVV/Jqlme1v4LCEELmmHTBggnWSingFxeqL+YS95cwJR5vW0R7A3ae+LMPLjU
         BKS+MroC+neL3J3K+FVDE1sO8EUf1An07niOerjAOlZbHxBi8UiPrVMjgNhhs/iV0pE5
         CvdHLvbObUW0PHeu6TO5DwBQGmHAVQkiP8LQjaFHNHDspSFiyr8GrhjDDoV6oq9gMPFO
         6DNJo1wUrG1tJWKFAX3tBmaxLL8gzqsr0raCJV6RfD6GLdMlYTB2FlGtKGQKSu4ykASz
         pT4MQ/gfBo+XCET9vBnEDSawPSwNJv0qijF8PUAx8QkqxuJ+JwKwV69j/mkC4OV7lfjs
         FXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=dzO+8DkoCBA6F9/FgXP2xqMTVHplZdTRr4XXr2DZYjc=;
        b=IHrAWKoSUElVfNa1GF3h0PLhnmg1/fo4U1FlRHBvkFifIt9X3Wvv/EB9dQiyXUiNUp
         9sdLuHABznpZiVvAYjaPsEpbP3Q9ATlpIoMd4JpsjWIlK/jk37lNGGZFlS4Xdn+S1zSK
         WxvZoXOor3fPzQdlDNHWrNTqAobl+y5pKoNgxG2BjvgyBwUHoteoYRA00aJqwctWqMb0
         Alsyf44TITG5L+245eGGXUyGBzixr7EwUGamKdUri+n30hE0WKe6d38m74yFoZ+jhcB8
         GpSneY7AyOfqt3UId7JVJMNd/eO5VsYSvt6fPYoeW+Ha9BF4NnR7aO64fuytRUOm2uCJ
         WV6Q==
X-Gm-Message-State: AOAM531O4tNBws4h4mwfb4xe0nEkdMQsoP5crp16BBGuvLt1YkAL057z
	+BiYmRMTQIb0nWcQO4pEPos=
X-Google-Smtp-Source: ABdhPJwhEIFzoYHAtNyMwAgmDJNB5YrnHSCad4iLHVfZ6BCPciEZ1oP8USulwgRznvJ2m/3gM3KNPQ==
X-Received: by 2002:a05:622a:1105:: with SMTP id e5mr930213qty.190.1644879657153;
        Mon, 14 Feb 2022 15:00:57 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id a6sm19404330qta.91.2022.02.14.15.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 15:00:56 -0800 (PST)
Date: Mon, 14 Feb 2022 12:59:53 -0500
Message-ID: <20220214125953.GB6130@wattson>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
 Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][RESEND 1/2] beaglebone: make kernel machine-specific package
In-Reply-To: <20220214221516.GI26229@denix.org>
References: <20220129193320.2945618-1-vdidelot@pbsc.com>
 <20220214221516.GI26229@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Mon, 14 Feb 2022 17:15:16 -0500 Denys Dmytriyenko <denis@denix.org> wrote:
> "make kernel machine-specific package" doesn't reflect the actual change, plus 
> kernel is already a machine-specific package - PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> Your original commit for beaglebone-yocto in meta-yocto-bsp is correct though.
> 
> I can take these patches into my new WIP master tree with this minor update.

Indeed using "machine-specific package" when I meant moving the kernel
artifacts into packagegroup-core-boot was confusing. Thanks for rewording!


	Vivien
