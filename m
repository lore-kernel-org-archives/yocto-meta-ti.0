Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.1315.1634687724736959439
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 16:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZyJ4jPl3;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id b15so1602734qkl.10
        for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=PlhMiUYHSf5Dlenm5TTBGfUnpJe8KIVErVNBolV0xJM=;
        b=ZyJ4jPl3Q6ld8XhhpLLJs5OJwIoNWmahPYp8RNP/53DCW8epnQhESitQmNmiwL9B6x
         80Bgc3tpGENBqro98rAJeCI9+jRMRCijumAB6ENceU16gutFSUXDAjCYwyJa6+/ri2HF
         +/dxA34zr8bqIkTUBGXnIb6oiZPONgbjGaaq1W9o1bvjabC7LT2adSb7VIz8ji08nnq6
         saTv9aCkSRIMFslhrjNVQ/5/WRYrT8Zr5H3hmMISj7qmvWsB+otAGqAnRMvVe6md0PGo
         LW9rpTRFYEpzp39AXdzN0EiVp0Yvp71/L0gjjbxXi2S6VnmYcnMATGOg6Jm7jEQeH1CW
         lK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=PlhMiUYHSf5Dlenm5TTBGfUnpJe8KIVErVNBolV0xJM=;
        b=Cjft8rAW0c3GK44eACuxbJauzaTSIOzfO3LrdEzLX9D9FLkAclFPxNY8kEfZASZG3a
         tRi+m8Tmlki/3w99ulhJLW/evs19RM3rp8a59pdFRbPma8Q4M+TR22iZnmtJ7qeTyAEM
         02DXiM5CTkNFhacmRrDK/Jfoqzji5pPeBpqsHpTZhOF6X19OcYDy6g+E3oCzOHT2Vkm5
         aWtGcf2UBPlftNcZDDpWMN1/PyNheQIuhLDGQmRBooDn8oqOl9HvX5df+3+I63SyKc2r
         OY18usYBueAsvD/sl8WCRD+VEFUOIAEMYxLMTQp8y6ecXNuzo9ksi1Y1tUzOFesK93Qv
         E3cw==
X-Gm-Message-State: AOAM530LyWYwAkX4qC/1jc3oTb6BtSFwTN8jk/qVumUcggwtajUP1AU8
	hLTP/S0Ff7vxRn7ZLzsDkAE=
X-Google-Smtp-Source: ABdhPJw+kzejH1kqLAbb4CsDywZvDOIIuXKwnUMe2Ja0HEeYueICoXMvZS41i1QAp3zuI24ufEyAEw==
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr2611953qkf.437.1634687722899;
        Tue, 19 Oct 2021 16:55:22 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id 9sm257645qkn.84.2021.10.19.16.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 16:55:22 -0700 (PDT)
Date: Tue, 19 Oct 2021 19:55:22 -0400
Message-ID: <20211019195522.GB4131237@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] ti-sgx-ddk-km: module installed but not shipped
In-Reply-To: <20211019225212.GU10132@denix.org>
References: <20211019173010.GB3938936@t480s.localdomain>
 <20211019225212.GU10132@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Tue, 19 Oct 2021 18:52:12 -0400 Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Oct 19, 2021 at 05:30:10PM -0400, Vivien Didelot wrote:
> > Hi,
> > 
> > With latest master(s), ti-sgx-ddk-km fails with:
> > 
> >     ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_package: QA Issue: ti-sgx-ddk-km: Files/directories were installed but not shipped in any package:
> >       /lib
> >       /lib/modules
> >       /lib/modules/5.10.59-g04b02a7e8e
> >       /lib/modules/5.10.59-g04b02a7e8e/extra
> >       /lib/modules/5.10.59-g04b02a7e8e/extra/pvrsrvkm.ko
> >     Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> >     ti-sgx-ddk-km: 5 installed and not shipped files. [installed-vs-shipped]
> > 
> > But adding a ti-sgx-ddk-km_1.17.4948957.bbappend recipe containing:
> > 
> >     FILES:${PN} += "/lib/modules/5.10.59-g04b02a7e8e/extra/pvrsrvkm.ko"
> > 
> > won't fix the problem if DISTRO_FEATURES contains "usrmerge":
> > 
> >     ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_package_qa: QA Issue: ti-sgx-ddk-km package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
> > 
> > Instead this unrecommended workaround fixes the task:
> > 
> >     do_install:append () {
> >         mkdir ${D}/usr
> >         mv ${D}/lib ${D}/usr
> >     }
> > 
> > This seems like a regression with the prefix passed to the module install
> > step, forcing ${D}/lib instead of ${D}/usr/lib when usrmerge is enabled.
> 
> No regressions - this part hasn't change forever. The internal Makefile 
> framework in SGX and RGX packages is very generic and convoluted, plus 
> somewhat old and outdated - it has no knowledge of "usrmerge" concept 
> and simply installs modules under /lib/modules under rootfs hierarchy. 
> The recipe doesn't dictate that, it just passes ${D} down as the rootfs 
> hierarchy. But I think I have a workaround for this...

True, the package "used to work" for me but I wasn't using the distro
feature back then. I'll give the patch a test if that can help.


Thanks,

	Vivien
