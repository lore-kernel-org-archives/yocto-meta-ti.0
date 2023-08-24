Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA1C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:08:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.11847.1692886131720408544
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 07:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g3nMPEaP;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52a3aa99bcdso2428358a12.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 24 Aug 2023 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692886130; x=1693490930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVwkCGVoKD+PDAPouZX+Blms/1wum70Cy5pYPQmcCNI=;
        b=g3nMPEaP++L03oqSvMmZ7Pd0rG5wfUFy3pLV47YxPT/nDuR94mRNu0OJHpg/ommKqN
         uDyd5AtFIvblzqxTAT7ceSQi4GTbZsK2CfUiD6MgvmiIvHHoTjXruNYz5os5xl3D8zVD
         PewfS609z7JU4XBfcnZ7MHNxS58u4tUCJw1catlrvH1AOF+Fr9buKwVmv3Dx5KJh8lU1
         riU6gzXZ5U9R8MgkBAzRgudhkp8f0+ZbA+whOHEVrtWFuTznoBDQ2rAtXucODvbcwZr6
         XpVADSxEv3G91DgfkXEZV1BIHO9G/9vdbhoCsmStkH3iNomh/zAn9uAQIRn3Hsc8MXhA
         D0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692886130; x=1693490930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVwkCGVoKD+PDAPouZX+Blms/1wum70Cy5pYPQmcCNI=;
        b=fWA/bbDdeLoRws/kTyffsH1+imnlB5DDIdllAHgKFjZ31qMvV8M60YgrjP6KyHX3lK
         6nx1Fff5YzZ2nzYEZ/XVKD3nHH5bxS6zflU2orXZHEwS/L6LydP/UWwY58BpQ+gB5Gtj
         kGSOfAlHKKFjq6wS69BsrZgN/3cJZDHYqYfHDpmLuZgEGJqC6v6L7LhzCyXONGcrR/Pl
         Q9EReOS7fOgjSycbnDz2uqVOsTCVnz1y2joKHavnzQcsT0XZ4suWng8B3lJvBf9O2ko9
         vJit4uUO5bdpyarICfgY7N4fVt2kXLHFF5h1CSlQ4r9VNMljlpnso9e+vfLVKbtHCsqe
         QeRA==
X-Gm-Message-State: AOJu0YwQ5xyByZPuQl5hrNutfJMDYpiE1QN2ddUEtferwwB0NA9CWldb
	HuXS9o4I1NRFXLrnYDcPr1od30qIsho=
X-Google-Smtp-Source: AGHT+IGrsC8FBbueAUReNdq2EPeVOqA6GWn4HzfCLhum+nmKofv6kh/Uc2Xq6LBCV+IrfcEB7Dub9Q==
X-Received: by 2002:a05:6402:786:b0:522:37ca:a51c with SMTP id d6-20020a056402078600b0052237caa51cmr10330252edy.40.1692886129800;
        Thu, 24 Aug 2023 07:08:49 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id m22-20020aa7d356000000b0052a0955f7d4sm6515528edr.85.2023.08.24.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 07:08:48 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: max.krummenacher@toradex.com
Subject: [meta-ti] Setting SERIAL_CONSOLES in machine.conf rather than SoC includes
Date: Thu, 24 Aug 2023 16:08:48 +0200
Message-Id: <20230824140848.1981957-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Aug 2023 14:08:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16889

Hi

The following two commits do set SERIAL_CONSOLES and
SERIAL_CONSOLES_CHECK in the the SoC specific am62xx.inc and k3.inc.

With SysVinit this does spawn a getty on each tty which is specified
in the variables which also appears in /proc/consoles on the running
system.

31eb1aa2 ("recipes-ti: Add recipe and patches for jailhouse support for am62xx")
bc894bf5 /"conf: machine: Set common default SERIAL_CONSOLES for all K3")

Adding whatever tty comes to mind doesn't hurt in a SysVinit system,
however when configuring OE to use systemd as the init system a
getty is spawned unconditionally on each listed tty in
SERIAL_CONSOLES, SERIAL_CONSOLES_CHECK is ignored.

In the light of this, shouldn't bc894bf5 be reverted, i.e. the
setting of SERIAL_CONSOLES done in the <machine>.conf file and
31eb1aa2 have a follow up to move the change to SERIAL_CONSOLES?
This would help people which do use systemd and include am62xx
and/or k3 in there <machine>.conf file to not having a getty
on an arbitrary tty.

Any thoughts?

Regards
Max

