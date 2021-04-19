Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.6017.1618820384298082939
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 01:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=UTo6hAZO;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198]) by mx-outbound18-250.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Apr 2021 08:19:41 +0000
Received: by mail-pf1-f198.google.com with SMTP id a4-20020a056a000c84b029025d788a548fso1009786pfv.8
        for <meta-ti@lists.yoctoproject.org>; Mon, 19 Apr 2021 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyY5QPqVrdl2QgAD2n9U5AlTxujlqIT1Kpfr+h8tutw=;
        b=UTo6hAZOxRzaFIr9YSWNzGj5e0c/N/upYtoNxmXXNPhQe388wXjX66aZT93ZgikLn+
         13oLECXcdK6QKCOUlW45tIw9m/xbmiKCjy35AjVQ+uM4WhIWXGjnuQFL7+U/k7fru95h
         INis89bNyMoI+IEvY3ScEd5gABPPsCayj+ri4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyY5QPqVrdl2QgAD2n9U5AlTxujlqIT1Kpfr+h8tutw=;
        b=HbuNkFnU7XeejXYnL4/NVM88ZwQZE5fz1fidNKyKKBCoFW1WjGPQcaetAKXsqd8tTl
         od2A87OSAUZyRW7AaXd3wGfmtB6n1qW2bHohsn5/U4Jw0ypjkDLzzWvg/Tla5mqoQpY8
         6TCpkb87ruNNdKIUCoKcCBs+0QoS9qxysktfdETiYzURLO/Fc0VVoGT2WfQAsCarPqPy
         fv7P/Ctcv2N/0ctgYIWSjIorDxJc7gI0SEMNe7vjBw+xGU6qcNzPcAgFxtPj6odyLdEz
         prXX6W6K/Ry8DvzUmn8a/NIGiDEDzxPi+nF7hf5d3hRwISi+M/xE7/ZmFy+vgpQBlvUD
         tcnw==
X-Gm-Message-State: AOAM533E1OdbYn6j1k209tuhGrcYGJnex2n0tLljL6RN/JC/wteDS0v+
	XYRid3F+Sbtrw6ZCGHWKr+SnwhMeHJHlkxDDlknvZi+BECcsjS/NVWCGsYxSuZCza4KJFA9pHYr
	avCXnT/RorVVN9tbFfRiMNBaT29sOKDiEkgg4AZvyrPUUomdS1eQKc4SoEw33gTc=
X-Received: by 2002:a17:902:cec1:b029:eb:66ee:6da0 with SMTP id d1-20020a170902cec1b02900eb66ee6da0mr21803005plg.84.1618820380231;
        Mon, 19 Apr 2021 01:19:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBvUUHWo039rrxkP/I8cunx9x1NQXlVrZygSTMPa3oSR8oz1D/bru6i4DAVRnR3cfZv3WKAA==
X-Received: by 2002:a17:902:cec1:b029:eb:66ee:6da0 with SMTP id d1-20020a170902cec1b02900eb66ee6da0mr21802976plg.84.1618820379881;
        Mon, 19 Apr 2021 01:19:39 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([223.227.14.13])
        by smtp.gmail.com with ESMTPSA id f18sm10804803pfk.144.2021.04.19.01.19.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 01:19:39 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH-V2 0/3] *** AM64x Unification ***
Date: Mon, 19 Apr 2021 13:49:28 +0530
Message-Id: <20210419081928.35808-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618820381-304858-5712-132698-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.210.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231659 [from 
	cloudscan23-62.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

AM64x EVM and SK comes with same rootfs and boot images excpet for the
SPL R5 where EVM and SK board have different DDR. Two processor SDK for
EVM and SK create overhead for users to download and install. 

To avoid the overhead two WIC images for EVM and SK will be created
seperately and packaged into single installer. The below patches are to
remove the entries of am64xx-sk configurations, update u-boot and
t-sci-fw recipes to build boot images for both EVM and SK under one
machine name am64xx-evm.

The patches for generating two WIC files are created in  meta-sitara and
meta-arago repos correspondingly.

Sinthu Raja (3):
  Remove AM64xx-SK entries
  AM64x Unification: Update u-boot conf
  AM64x Unification: Update ti-sci-fw recipe

 conf/machine/am64xx-evm-k3r5.conf      |  10 ++-
 conf/machine/am64xx-evm.conf           |  14 +++-
 conf/machine/include/am64xx.inc        |   1 +
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 100 ++++++++++++++++++-------
 recipes-bsp/u-boot/u-boot-ti.inc       |  58 ++++++++++++--
 5 files changed, 148 insertions(+), 35 deletions(-)

-- 
2.17.0

