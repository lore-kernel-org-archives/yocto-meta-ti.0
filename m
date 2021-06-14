Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.32052.1623686530987757465
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 09:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sEuLgU8s;
 spf=pass (domain: konsulko.com, ip: 209.85.222.174, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f174.google.com with SMTP id f70so23664913qke.13
        for <meta-ti@lists.yoctoproject.org>; Mon, 14 Jun 2021 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U051WkW8utvRg5qKD2HeHF1b5kgGWA/RIEUmjk+Oh58=;
        b=sEuLgU8ssEQbnNxNU50FJ+IEyctmLzjFBteFoNMzx+DzHEbVr1ZIUz534GOq9tmtrY
         s0FYehL8FvzePO2y/sOyDS1C4PZC/iTUYe5brE9LNVe/IdfFpW8nJtHbwSVXQJPFUPBJ
         /CxG0ljWhMAn/USC6T0/W5Bhxor0ir2PhbMpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U051WkW8utvRg5qKD2HeHF1b5kgGWA/RIEUmjk+Oh58=;
        b=uTKSKnaj1Z/Pj58z9XqOG0Tls16lRChykuQ+uKPxCgfkW3vVm623aOZnnMPB9zEyQv
         LIbm2bb0YKxclrgSY3a8COhsSnSNn2j+uS132dogwFDwOCT0jCGKzBx4DuQBSi+2x+Gu
         h3S8xwXe6GCHF86JepeBmdjvSbERIMgQkawWyz4J0LGOU3vUabCK6l+F7NjsH8n9v1r+
         wokLkmsaOrAXsqypem/M8ePIzlmUfwPk30AwrjFowNITnF4U4SxJmrTcUwcg6aAxCcHO
         ydgnCyY0U50ySUCaLDyVMaKBZs62d6ZlPqS54Ad7GrCbZnlFRG1NNDkT2VCQccY4upFC
         lT2A==
X-Gm-Message-State: AOAM531KOWjkl4oM1AGQ6DgfWgZlYLo8K6adxahjpUvPyi5iXkntiG+K
	Q/J2QlvFhauM7C2DmPQrf9F7HwQyBM8IrA==
X-Google-Smtp-Source: ABdhPJzvk2g/ZuO6JCxpvqW7SiCNiGkgOYNdW1f+gc9HVY8sNDveR3/B/HulEzscxn+X+o3mdoQNuw==
X-Received: by 2002:a37:a682:: with SMTP id p124mr16702qke.23.1623686529971;
        Mon, 14 Jun 2021 09:02:09 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-390b-d38a-992f-44f1.res6.spectrum.com. [2603:6081:7b01:cbda:390b:d38a:992f:44f1])
        by smtp.gmail.com with ESMTPSA id z2sm10047707qkc.111.2021.06.14.09.02.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 09:02:09 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:02:07 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Nishanth Menon <nm@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCHv2] conf: am335x-evm: Add extlinux.conf support
Message-ID: <20210614160207.GF9516@bill-the-cat>
References: <16875AD11A54340A.8333@lists.yoctoproject.org>
 <20210612131331.13439-1-trini@konsulko.com>
 <20210613193641.GB1528@denix.org>
 <20210614144353.oajmyqlnv4sjhyzf@reputably>
MIME-Version: 1.0
In-Reply-To: <20210614144353.oajmyqlnv4sjhyzf@reputably>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 14, 2021 at 09:43:53AM -0500, Nishanth Menon wrote:
> On 15:36-20210613, Denys Dmytriyenko wrote:
> > On Sat, Jun 12, 2021 at 09:13:31AM -0400, Tom Rini wrote:
> > > To make use of the "generic distro boot" support in U-Boot, an
> > > extlinux.conf file needs to be generated and reside in the extlinux
> > > directory.  The extlinux.conf file will be parsed by U-Boot and the
> > > "append" line will be evaluated and expanded and used entirely as the
> > > bootargs passed to the kernel.  Our generated extlinux.conf states
> > > that the kernel image and device trees live one level up (so the root
> > > directory) from it, so populate that location with our kernel and device
> > > trees.
> > > 
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > 
> > Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > 
> > > ---
> > > Changes in v2:
> > > - Elaborate on how this feature works in the commit message.
> > > ---
> > >  conf/machine/include/ti33x.inc | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> > > index 6dfda754e9dd..35e057d57497 100644
> > > --- a/conf/machine/include/ti33x.inc
> > > +++ b/conf/machine/include/ti33x.inc
> > > @@ -43,6 +43,15 @@ UBOOT_MACHINE = "am335x_evm_config"
> > >  UBOOT_ENTRYPOINT = "0x80008000"
> > >  UBOOT_LOADADDRESS = "0x80008000"
> > >  
> > > +# Generate an extlinux.conf file
> > > +UBOOT_EXTLINUX = "1"
> > > +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> > > +UBOOT_EXTLINUX_BOOT_FILES = " \
> > > +    extlinux.conf;extlinux/extlinux.conf \
> > > +    ${KERNEL_IMAGETYPE} \
> > > +    ${KERNEL_DEVICETREE} \
> > > +"
> > > +
> 
> Does it make better if we do this in ti-soc.inc ?

The problem here is that we'll have one set of changes for 32bit
platforms, where I think extlinux.conf ends up being best as if you look
at other distributions (ie Debian), they end up doing the not-EFI path.
But on 64bit, everyone goes the EFI path.  So I'm working through making
an OE image that has a reasonable grub-efi path for us to boot up with.

-- 
Tom
