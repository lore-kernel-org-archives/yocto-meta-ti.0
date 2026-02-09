Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17747E7E0CC
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:21:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45352.1770636116604166099
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 03:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxqsS99F;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: ivitro@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4807068eacbso38798795e9.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 03:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770636115; x=1771240915; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S5lgC5trVcANht34mE3bAOvHqdD5FnvL/NsmWYWCwrY=;
        b=jxqsS99FxbAQlF1KZ4QUD+yeYn7y9WXXkztvgy5uPx2KXXmRjCEyFFufqbim9TXEUr
         TV/cFKGgSzjsq3DqLMSTRYjOHMLzCjlNbHZApq2tLDU/CXgVmX3Lbgx7baNcZ5dSF9Ni
         Dvfzq1j/wVjqSYuMJ4pbHHpQVovxg3Se7+TBCjCkgc/veTDGJMvP4vbCz+lh76FL4bzL
         BNAjNQPNeUBPJrooihpwH/P1tOXH/oa9NSEyZldOo/5l75/7NO9UWq1jcxy9FBEkLPOM
         AAAfoDRryrYeg55aJwS8mTyhFIOfrFf89lvfMcGZQNQlS7ylKadBxzEiysYlT0gaugiu
         fSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636115; x=1771240915;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S5lgC5trVcANht34mE3bAOvHqdD5FnvL/NsmWYWCwrY=;
        b=SGksOwpQAY21ltWobB+zTHJetFG8iMLcCdIhphOk2kspaXQkkt5Eq2/6Kb85JQh+wK
         ue/JeuRklwWvXHFkdqSkUwkYEDxIvEhWg5rUz7DzQ72s/x9K4d41MHLpF+edRZNgHv0p
         eK5ZA1UnSRggzF1orlWTS25ZAcwEfx8q1vizyoNbqN7Wy2Ul45KiYAbjhxsYFAAiruj7
         DkXL8V3mrIPnvIf16H7fbeRtWhU5dVsArZjtWp2cAPgVvX3g5KDpFlISLoB6gZFM4y3W
         4/iFLdxZz6MRRPCHLMtxCataJ8ssSGrHlPoLZpJTKgc8+ufbBCZf9OHXiqB+igGtiDwa
         C2TQ==
X-Gm-Message-State: AOJu0Yyprlt+r+3nvCVxH+TXpgNMTP9mrQsU94izq+YGv8l+tok0zYcE
	SNujSUPIwJgTzmG4Hm6K8hyXD3/akczOg6GPG8lzgh8QaHwPdSXqZqEb07nS5w==
X-Gm-Gg: AZuq6aJxgR/j2N4LFcMXgwVpDmGmq9t+ol3XhD79Otthe33Z8hrluMZQGWJKju03VBq
	xdcuxVYu8FJE2GJ2RjBjzWWHHU0jHhPxrQoES3FJRt2hADZyQbm3MdwREEYQg4ATK/mGO4g4WeN
	v13ZQddwHyE5MD8oBsEvUpZPcuIkxIVFoeToqSgIIJcHnLVg8hgiz8s1LcOJxMJgYDsVAI7s4Rw
	6opFdxe5D9iYnmBiI+M7xMDIPjlZgBXM6AjeLg6wi/u3BKwN29d/h44w9lYIL0rli2Cabtlb1Ug
	DzkbzVJz14HJujTMBfNrA1JAgWFMFIfKklyyZIeMlTXfnubkTMxH5GY4AynWlIcWdp0jVgXC6P1
	eIGiZSyMbjX1DRxoG8MIjsvxMy0pyCjDpC4tlfS2uKiOCdWEpG5UpirQ3hX14adtZhsZmgeikXY
	AqveGXRWDrC08E4mF6DyBL/Tk6WRF+naSArQ==
X-Received: by 2002:a05:600c:828e:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-483201dadc1mr176833615e9.6.1770636114665;
        Mon, 09 Feb 2026 03:21:54 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203e126dsm172510725e9.2.2026.02.09.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:21:54 -0800 (PST)
Message-ID: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
Subject: [meta-ti] BSP version selection forces initramfs integration
From: Vitor Soares <ivitro@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: reatmon@ti.com, denys@konsulko.com, vitor.soares@toradex.com
Date: Mon, 09 Feb 2026 11:21:53 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 11:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19472

Hi meta-ti maintainers,

We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED_BSP =3D
"mainline") also forces initramfs integration via ti-soc.inc (lines 32-49).=
 The
bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditionally set
BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_FILES.

This means we can't use bsp-mainline without also pulling in ti-core-initra=
mfs =E2=80=94
even when our images don't need it.

Since we can't use bsp-mainline, we also lose the correct override context =
for
other components. For example, we end up having to manually override all th=
e
mesa-pvr.inc virtual providers in our machine config to use upstream mesa =
=E2=80=94
something that bsp-mainline would handle naturally.

The root issue is that initramfs integration (an image-level concern) is ti=
ed to
BSP version selection (a machine-level concern) in ti-soc.inc.

A possible fix would be to move the initramfs logic to an image class (e.g.=
 ti-
image.bbclass) that images explicitly opt into. This would be a breaking ch=
ange
for images relying on the current automatic behavior, but it would properly
separate these concerns.

Would this approach be welcome? We're happy to contribute patches.

Best regards,
Vitor Soares
Toradex

