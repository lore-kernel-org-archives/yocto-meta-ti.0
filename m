Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.477.1615322556771369476
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 12:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m3ByTFLj;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id o1so11272677qta.13
        for <meta-ti@lists.yoctoproject.org>; Tue, 09 Mar 2021 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=uQcvjkrjaVO8kbCG6HiEQ8FpFb/IOqC5QW2tbXaYHDo=;
        b=m3ByTFLjHuN+ax/u7gUxhbGFN89qBiBzdeuU1SVNz1TAZXeB34ShIltFXp2guDHy+D
         SU8h1bvXOJOO0FYjxWfJW6mpcfjSL9QO4Hail1C2049W/QzG+cF1G0EjWeaz7IbLSKyM
         3A6WHMQ8XE5VxuhaTU27Hz2qCiVh4Cqp7lPZPIgEDDnXvyiwZaY86VrMeQUEcP4QcgMw
         XvNBy/7m2JYV8IVG3UwR8eLpfyFNI1swAqqId6/oEhZSQ/b6d2fvDSUjWDOLOgc9Z6f8
         tCIyG+QMvDsGpUuLtoGX6yZjv8AGZrAQv/mlvVekmHT9ZTYRpdAoDV37khj6uVgno7uv
         s4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=uQcvjkrjaVO8kbCG6HiEQ8FpFb/IOqC5QW2tbXaYHDo=;
        b=ZVm2gTac2MvH60a43TOmSW3JDrZRyBBSnAPm3lsNVIhgJuFxgvt+NYgLOQbJJHzn5E
         mc0IA5da8gZIhX5EN12nqCHUgsKtcUhlTPoezOb9Q4eeUsZ0IOJfOwc2CPJYQDeTnSBp
         Wkijy+Swsx2mI6RdWWXqc0mJWmyyB6pJOSDrfXlDEcXz37FKzE3qMB6UurUWOA2951/U
         LxDdRK7wCt+TRr3j4Lu839RQBPgQRAe0InHDUFRfVtNnkONR8H4ogpMPDZYpSCiN09vp
         nqjSz66bPyEB6EpUURLLkgiREc4oFGvrG45ZbC0KNuRYpr/VH1SiAxXUlOVZv6M7X5Ho
         1MhA==
X-Gm-Message-State: AOAM531jw9YqqXGtTfqgJjdW6EgRR8XQXHcu/+WJX8X8c/3FpS4/VJOC
	GDpiptCgIOK/OtdmuvAVe9R5q/QTp18=
X-Google-Smtp-Source: ABdhPJwKjzOBZnSrm0kQp1GdGVx5sx0iCl0LXjw20eSctfnJdDR9H6NkJ7SdbNlY9f7lpoXVaGU1DQ==
X-Received: by 2002:ac8:58d1:: with SMTP id u17mr4595687qta.271.1615322555837;
        Tue, 09 Mar 2021 12:42:35 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id j12sm6177216qtn.36.2021.03.09.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:42:35 -0800 (PST)
Date: Tue, 9 Mar 2021 15:42:34 -0500
Message-ID: <20210309154234.GB55678@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] ti33x: allow different virtual/bootloader
In-Reply-To: <20210309203413.GL4892@denix.org>
References: <20210309172331.22122-1-vdidelot@pbsc.com>
 <20210309203413.GL4892@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Tue, 09 Mar 2021 15:34:13 -0500 Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Mar 09, 2021 at 12:23:31PM -0500, Vivien Didelot wrote:
> > Boards like the beaglebone currently hardcode "u-boot" as a dependency
> > for the image and the wic format, and this prevents one from choosing
> > a different bootloader via:
> > 
> >     PREFERRED_PROVIDER_virtual/bootloader = "non-u-boot-bootloader"
> > 
> > Depending on "virtual/bootloader" instead of "u-boot" fixes this.
> > 
> > Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> 
> Could have added Suggested-by: here. Oh, well...
> 
> Reviewed-by: Denys Dmytriyenko <denis@denix.org>

Oops I messed up, can you please add your address as Suggested-by:,
and set the author address to my Signed-off-by: address? Otherwise
I can resend if that is simpler.

Thank you,
Vivien
