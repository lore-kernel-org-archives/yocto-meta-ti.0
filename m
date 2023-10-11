Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEE1CD6E66
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 12:44:41 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.15504.1697028276309861466
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlZIN67z;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: perezmeyer@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-538e8eca9c1so11782307a12.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 11 Oct 2023 05:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697028274; x=1697633074; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ySxul491gzcgjn4/Gl0DoWuOwkHQpgYKKLkzUapPaU=;
        b=KlZIN67zALZSwt4k57faQGw8BIP0Nx/i6bsAJDoPDcJKU+b/4oARba/8bx9gTqsH9c
         O6S23x4LQKieMA8hVtqBUu7gp5XMJFvVJi8lq6dos3iHYfYqkD6pxHdw1853KcEO6LqM
         cp2KAxUKTfNAxxZeDcDKMbhfbgn8h7Otb1dYRDMaADUpjN68m046J8VmZ9kbt/5S5qSA
         15Ck8cKSQTvJBeUDFU+CjzBsmo3bDBG4t2d6WCNNMdWSIi+Ot8sFMjqAFRoT3B8dUdMy
         vyxrG1xu+/ZCseKChrEC3+f6zJGioHQHOB9HH6LN/EHX8kJ7l7Sgj3fFwJcZTCHPvees
         hsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697028274; x=1697633074;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ySxul491gzcgjn4/Gl0DoWuOwkHQpgYKKLkzUapPaU=;
        b=cZI9SRMgCgx2TTpReOojF7E3qmomyF7KzTYBPs+02wLOhHjAScTtUTScoLYVkI/m1t
         u2RNZdfAVOzbK3ouZ/boUFDpKdOLctaOPD2aoW9RY5KjpgZxelTP/5SdsoEKwrNR6lVv
         +SaNHhXDn5sGx0t5eSHJBj0jEyrUhfCxjp1tUCDS2tPoDfJpvezv4cWKgCERnffQISxz
         1AeRcdqoGl1bpQL2j+dFfGcPU5detCTSNzT9ApVh5oCnaiVU9/42Nmao5kA1kDt8k2lw
         CtgVADqAQrknK51FbeEGRXAqU2yps/xS9CYWpUXHG2IcO3eh+rGG3RzlPjUJ21grqrjQ
         ZWXA==
X-Gm-Message-State: AOJu0Yyq42wLn5Ppt2Gs/3ffSiceCpo2Vj7bhVvcJgZfwyE6D/TqKT6G
	VkkRyK/EK9IOcorXjZmIawx8tTRp3y2eVje8Mw/VFAUop48=
X-Google-Smtp-Source: AGHT+IEz9+/fGwDExp2uzbxLnlhGsI4zeQmCMDL21/T9fK830BDALSr/Sq/KBPalE6nUB8tdgBJuUbHe0JAskSZuCmQ=
X-Received: by 2002:a17:907:2e19:b0:9a1:bb8f:17d0 with SMTP id
 ig25-20020a1709072e1900b009a1bb8f17d0mr18448768ejc.30.1697028273885; Wed, 11
 Oct 2023 05:44:33 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Lisandro_Dami=C3=A1n_Nicanor_P=C3=A9rez_Meyer?= <perezmeyer@gmail.com>
Date: Wed, 11 Oct 2023 09:44:21 -0300
Message-ID: <CA+QPbz0JEs2cFDm81AZmsODgHgsiVhcKe4ASQyTK9-xEeJjwJg@mail.gmail.com>
Subject: TI_COMMON_DEPLOY: wrong default value?
To: meta-ti@lists.yoctoproject.org, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Oct 2023 12:44:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17090

Hi!

In https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp?id=3D4dcc70a8778=
e9fe53ca43bda22b144edcf1dd7c8
Denys set:

TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"

Now it is customary that the deploy directory ends up in
${TOPDIR}/tmp/, so probably that should have been:

TI_COMMON_DEPLOY ?=3D "${TMPDIR}/deploy-ti"

Regards, Lisandro.

--=20
Lisandro Dami=C3=A1n Nicanor P=C3=A9rez Meyer
https://perezmeyer.com.ar/

