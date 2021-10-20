Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.2718.1634696401686906875
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 19:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D074Mieq;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id t16so1786756qto.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=oVNEuqkHwJwku1itWHbgAwxo5PBZJbPciek/f/F4YDw=;
        b=D074MieqE3blu3q51ZebDl/KkdKHtmGCCJq/FEE12KgZ+FoG49zofIgpKb7yhXBlko
         pDkxkHDElh5xtJk5oGCv5Dh8QrSKrn9d5X1L/uakCH/QPknZ+EmyiaOWeMPVtb+eeBBR
         PK1EJMxbDsEiw1AWjQ7gl2HlI9yCkqwU6JYQtRo/+HlyS63kC+VuYnPXT26bUNsLxNMP
         MfvnQCbpunpVHqDhwXuQYb4h6woTWxso171UnsjEhLoa496LheOhvJkKWrthwo+aA/DD
         IsVSyzP/Suk6UugJBRwqgzowWJcGeS5vlBn08NUS1uYhSc8V81B2tkT00iYdqH1SsOjE
         dUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=oVNEuqkHwJwku1itWHbgAwxo5PBZJbPciek/f/F4YDw=;
        b=QEapXojs5D/Taaudl8Qyop0I1vuYCBW4pPgkqxYJ0ASCy9y8cThSFHYYWZ9HcrAlEz
         Ek4KA8HJEAmEulckP4tyuBkRvi6N/NAJlAAEOUcq2enrMHbs/3R6ySfvr+iyKgbDStAY
         06RVlyQYKGTjwVAB0XALZkC240dOhlrN1nrgy/4c5KHUz1QzBGHL8ggjXo+E3SZZWgbZ
         W2AcAtZB72xnWBevL7wcmp1mgpdbIkQ9iEB/1rnBIyWOjdCZjc7cPF9uGIT1qEbBNPqr
         7n028c0UT4A/WgbIbrspY/soWVnrzTFwOTdPXTRGmi06rvUJ7g1M82sZlNJojYkDgS60
         dcXg==
X-Gm-Message-State: AOAM532Peu7mWlOj0js39ToUTxf3GYCPNxtu89Ar6PoOlzwvUwnrbJDT
	sHV2h35L5Q36Um7N+6byCQyRJnw6xN4=
X-Google-Smtp-Source: ABdhPJwvZ3REeNPTRKVm18As2YyQxKq8C8blfbQSK1PTIeuHRwtflXB5TqtXmi2XNFODaZ4emdAbKw==
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr3929259qta.132.1634696400739;
        Tue, 19 Oct 2021 19:20:00 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id c9sm362920qtp.75.2021.10.19.19.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 19:20:00 -0700 (PDT)
Date: Tue, 19 Oct 2021 22:19:59 -0400
Message-ID: <20211019221959.GB4184833@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH] powervr-drivers: teach modules_install to respect "usrmerge" distro feature
In-Reply-To: <1634684978-3972-1-git-send-email-denis@denix.org>
References: <1634684978-3972-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

For what it's worth:

On Tue, 19 Oct 2021 19:09:38 -0400 "Denys Dmytriyenko" <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
> 
> When "usrmerge" distro feature is enabled, root directories /bin, /sbin, /lib
> are simply symlinks pointing to their counterparts in /usr. Hence, modules
> should be installed accordingly into /usr/lib/modules/...
> 
> Since IMG Makefiles don't take the direct target directory, such as
> ${nonarch_base_libdir}/modules/, adjust the top-level rootfs path instead.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reported-by: Vivien Didelot <vdidelot@pbsc.com>
Tested-by: Vivien Didelot <vdidelot@pbsc.com>


It would be really appreciated to mention the reporter or at least a Cc ;)


Thanks,

	Vivien
