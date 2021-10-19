Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.16553.1634679012265118911
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 14:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XRLejjGM;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id b15so1307701qkl.10
        for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:subject:references:mime-version
         :content-disposition:content-transfer-encoding;
        bh=PiflRtq5sfFrrA4V7Tzohu2O12WymPP6IgySEKPN3xU=;
        b=XRLejjGM3OygYvhpCfiYU8uItM7UqPWurCQ9vu1v4K6+PHHLjWFigLUkvj3q7q/vs8
         QS9OZ+B8+1SvwkGO/QjerCMLlYy3Hg0I/rEoAmal2Dv+5bDpLOdrZtGR2n58heKspshQ
         5hMUb9uiwCkgXX1EsteVLEyxcDUwGX3vubcz7Vcq1HwoHbdB85+F257t45ElnhuYzINU
         JKSIIptJIKo1HTWtiKvhQSXv3Zzd0EgOww9FajstCYhtwW+G8mNtvOa3cK1GFU6ByKuN
         CAwN5Cvqn4xXHb/ItDFyNQt64a+XSlW4FxCbwOLUpGg6IAJJ3RxlUy4xf5cIylZo+PcY
         id6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:subject:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=PiflRtq5sfFrrA4V7Tzohu2O12WymPP6IgySEKPN3xU=;
        b=Wmk009giTsbny+CX1iPUNpXMJ8hf6cWQ8gHM5DNqea4b8pGA0DP2h+BxypUFAz670X
         9hhCpt4T/hEptey/rk5TRspQHrd0V+VhEtqFUkPPK9ePIO/aD+Dchs7NanBgF3XuDbdz
         M0COIjCxORkX3trxrpcqKvjjtkiPhOrZSCfr0D8CGQAGfm03Om6Slx3VrZQgyVEiSQkU
         cQ0zpYvXbuH6vkEAT6MdXj5Qqc/GCyfSaI/4pSfG0N4i+AU1dUSxxbeG7G4SAIy7t07X
         BA4XEdycB1l56hg6HCPjrJZtYQ2yy9fxHqvKPDPy/1d6hYInD6nWA+3sJDD+OWu8/WU3
         8XZQ==
X-Gm-Message-State: AOAM531k+gejHL8tdRwFMQHs3uXtQox9IDGW+Er58WaVeop4nDkBHnkR
	IQeuRlca/X91bbm6ApX/4Nd+5Q6VTRM=
X-Google-Smtp-Source: ABdhPJzvIbelAadol0mjX+oyJUWcihYZqPhYGT7pCeMyGlLXvfnJfEbCXItvD0BSXz+fseqgXhkCwQ==
X-Received: by 2002:a05:620a:31aa:: with SMTP id bi42mr2215953qkb.76.1634679011140;
        Tue, 19 Oct 2021 14:30:11 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id 6sm116116qtz.13.2021.10.19.14.30.10
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:30:10 -0700 (PDT)
Date: Tue, 19 Oct 2021 17:30:10 -0400
Message-ID: <20211019173010.GB3938936@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: ti-sgx-ddk-km: module installed but not shipped
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

With latest master(s), ti-sgx-ddk-km fails with:

    ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_package: QA Issue: ti-sgx-ddk-km: Files/directories were installed but not shipped in any package:
      /lib
      /lib/modules
      /lib/modules/5.10.59-g04b02a7e8e
      /lib/modules/5.10.59-g04b02a7e8e/extra
      /lib/modules/5.10.59-g04b02a7e8e/extra/pvrsrvkm.ko
    Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
    ti-sgx-ddk-km: 5 installed and not shipped files. [installed-vs-shipped]

But adding a ti-sgx-ddk-km_1.17.4948957.bbappend recipe containing:

    FILES:${PN} += "/lib/modules/5.10.59-g04b02a7e8e/extra/pvrsrvkm.ko"

won't fix the problem if DISTRO_FEATURES contains "usrmerge":

    ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_package_qa: QA Issue: ti-sgx-ddk-km package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Instead this unrecommended workaround fixes the task:

    do_install:append () {
        mkdir ${D}/usr
        mv ${D}/lib ${D}/usr
    }

This seems like a regression with the prefix passed to the module install
step, forcing ${D}/lib instead of ${D}/usr/lib when usrmerge is enabled.


Thanks,

	Vivien
