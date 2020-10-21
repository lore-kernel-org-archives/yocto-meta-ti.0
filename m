Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.13816.1603294967164006279
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 08:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pnE00Scz;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id s1so1310429qvm.13
        for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2020 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iCs3I501HYTX1yK6QelGPoWlZhP+0U5kV+tr/eNmgh8=;
        b=pnE00SczTslz7Zl2faKCnSPJmL1afj0nocmgCT443Yzhle+jpNWm9Nq1zCWZETbJz2
         6b0+P9yGoKRKUmvPOj21dwQJMRjJhJVtmHXdHuX2sjY+iEKGDwJoNKbJglPQIP3QQqrg
         ri5eaqirbwT9ccN9/Pfi9J1abBjXSMUpDhQO07M4wJ6R+T1zFdKR4Rdn6pXDM9vR0OW8
         zJTmpn7C8OVi7MBHr0G+WjFpEa+rPB1qqbUd/9Oh5IAgWpk/HMQdPxEHIEFZgXf937V3
         1G0M9luOKPOIlJpsjh8qXLG/F1/BMpofF3edU1ESb7nWUYJwCpDGyNW0oyh/6oW8lXZc
         fY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iCs3I501HYTX1yK6QelGPoWlZhP+0U5kV+tr/eNmgh8=;
        b=mNYC73UwNZrcd9wI7hjPLsQZN9uvhoz3tbGmLRLBbz0fqQlDrMbCelcJeIXwY1QY7S
         fHylSmH0ZdNE526DiHUxYG8sLtuCxDzlX7fs3ZcDmPVCTYIVBm391aT+93lohevVvXij
         0LSfN6y7DvBngkMR7aLk6EAlHnKRi/HfmoEh2uGxAniwHJIrGSGvs+I/sSUWCNIMscu2
         LgONaqxWawO/8Ud7yB5XjVYcSlySEvz+VeZgELrQsumbMAYNVumXuEqwPiq4YKgBQIH/
         8kPo2tg/tcxTU7lCVrLBvZYV7UUnRrhGgi1Ebbd4iPC24Nxes2Kho62QmcNr8cDTia4U
         e4+Q==
X-Gm-Message-State: AOAM532OoospX5AqnzorWdyDr786jM60cihxQJXS5ZNYxFnZR/sOjjwR
	+E6lWwRS1ow0/s5sg0yZ+xPHnCDHhLqx8gf+pLI=
X-Google-Smtp-Source: ABdhPJwbrhFZ0+NAMapRQmn0wbttstSg/qlsHUKXe7E/VOVk8BMV1UCKGCPkj5Jgzn/5h/pPwI3qRSBRPERgzGssL1A=
X-Received: by 2002:a0c:e387:: with SMTP id a7mr3495858qvl.21.1603294966266;
 Wed, 21 Oct 2020 08:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201020181601.29276-1-raj.khem@gmail.com> <20201020184341.GB14852@beryl>
 <0fc0e5e9-005d-02a5-687d-aeb0cb89c4e8@ti.com> <56d43279-dbc4-92b0-67dd-70bb4289e355@ti.com>
In-Reply-To: <56d43279-dbc4-92b0-67dd-70bb4289e355@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 08:42:20 -0700
Message-ID: <CAMKF1sqSfNJ7q+WKSxNL1cG=W7tfCkE0AADtpUSfmA9s5utX0A@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] layer.conf: Add gatesgarth to LAYERSERIES_COMPAT
To: Dan Murphy <dmurphy@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2020 at 8:17 AM Dan Murphy <dmurphy@ti.com> wrote:
>
> Khem
>
> On 10/20/20 2:17 PM, Dan Murphy via lists.yoctoproject.org wrote:
>
> Hello
>
> On 10/20/20 1:43 PM, Denys Dmytriyenko via lists.yoctoproject.org wrote:
>
> On Tue, Oct 20, 2020 at 11:16:01AM -0700, Khem Raj wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Reviewed-by: Denys Dmytriyenko <denys@ti.com>
>
> Only applicable to master.
>
>
> Applied to master only
>
> This causes a build failure on master
>
> ERROR: Layer meta-python is not compatible with the core layer which only supports these series: gatesgarth (layer is compatible with warrior thud dunfell zeus)
>

perhaps you are using an old snapshot of meta-openembedded repo ?
