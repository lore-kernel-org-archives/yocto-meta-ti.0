Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C76BECD6C7
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 17:15:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24285.1770830137187346018
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 09:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0I8jr5s;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: ivitro@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48336a6e932so26120165e9.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770830135; x=1771434935; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nX8kwqpLhvTYZb4NMuPWLirdfXUzsjY67AZVgqVLC3g=;
        b=F0I8jr5sVQtqkFdk90B0JwToeTSqMBCJaKTgK82axVHeRICV8BPhgV8fcCiFqYdB5i
         oTZv6cTcG3K/owwZCVWvli9hl/Mu2EwiQ/ZvZpfrMZT5dYFXnqXvBDQY1bIDIjwvkb+t
         XYA+nfSU9UihyVlU1r7iTmbpcM9MrG+Alsg2nAfZ2PwmGU4rsBWd0FOrn02sVlATneYk
         taUeUgzIxLu50/0zuC9TfDNCUdJhYNyvmEZbnt6qyWXG+ESkoPVrrvPwnEs4SIhS28vn
         eX0XE5QLT6V5Qtuk9XKsYYPRZx+ygUL/aC2sp5LxoezFWrTSycI0uYKdzHQ/1C9g/xXh
         wJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770830135; x=1771434935;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nX8kwqpLhvTYZb4NMuPWLirdfXUzsjY67AZVgqVLC3g=;
        b=NHUUzrWpf/tu5ZtyVayt3WM6K6ptCBErQALc9lScZBa9jlJh5P70R6WbAp3jsXT5oG
         PoI9jD5dzp8nHB6K9Xx8/t0MNUeuOgyvYl5p+SxwUoTQLuQnJd3Qrv2616dETp4yO4LB
         +QJo+lGwNvs/RsSkwUO2zcs1P80qQi5Xy4mAE+Xy3ofL/zaxschk5JzFW52uF/R8x0BT
         vgnKhZ0O03pYYRLLrh4zP+bhGp4zulql5ETtOo77KP+LwCkqSQOUbctt77I+qwova8P8
         RlyVjpQ/A9kkifQ65+85kCjmd13TL2d35idS2dND3a3h8cHkUFHFeLBJkCJ/8Mi8hQoC
         C/gg==
X-Gm-Message-State: AOJu0YyJqxZIq6WdjFDB2Ra0gfMeLMS7ggeSrFn755ehyF+L53dFtYMh
	RbAhJRovzpDrTr/tLiUgYmjGHBHwydHWEU5ueMcOgcOsShpSlpZifgWBRf5GlA==
X-Gm-Gg: AZuq6aIJgaxKG6XIQ/Ev/NcvAKWoxnLa5UuYzbuWkU5QTpO7IyJk7G2We7MZKcng9sk
	wfRHcIO46EJtMKSdnlcD8oYBd082h+kV3HQzALcghPPYkjPoCN6VDOTGDixyG9PKoopFiRR8r6f
	ZGd0AKVoWIfx9PGYeCsW2V3yghh/xIjPjvfG2rBZvfbIAA3d4RMoOHZYp5XxR81QM7aJngYAexI
	J8gDfzqtYiCL3HWNCjD9C/tagkG5+lAVVGDY/eRWu8YtHrVNkfsdkxir+u7/kWYMKjBewYkNg0B
	CDwbCpQM/sVKxYhQ4x7rNK5fvXywUWnimGdvcXRihXLeiK7saQyBHh1ObCNPH12vv8KqZ0kyA9p
	bXFtPWpeNvkBAgHZEo9Jv9ob8mxQWCD2S8BINgDSb6imRWR/C4o9Jy0vBHpvdpBF8U4JtDaolkB
	KFV1Lf1eTsnXUC2uQfTz4F32//6jmA2clULkSrwGVzxzA7Lg==
X-Received: by 2002:a05:600c:4e8e:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-4835b95240fmr42690335e9.18.1770830135283;
        Wed, 11 Feb 2026 09:15:35 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfb28dsm55702625e9.11.2026.02.11.09.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 09:15:34 -0800 (PST)
Message-ID: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
Subject: [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
From: Vitor Soares <ivitro@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: reatmon@ti.com, denys@konsulko.com, vitor.soares@toradex.com, 
	francesco.dolcini@toradex.com
Date: Wed, 11 Feb 2026 17:15:33 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 17:15:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19482

Hi,                                                                        =
   =20
                                      =20
While working on our Toradex Aquila AM69 SoM support, we noticed that k3.in=
c
defines:                                                                   =
   =20
                                      =20
SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"

This caused systemd to enable serial-getty@ttyS0.service on our board, wher=
e
ttyS0 maps to main_uart4 - a user-facing UART, not a debug/console UART. Th=
e
getty continuously outputs a login prompt, interfering with the interface.

This made us question whether SERIAL_CONSOLES belongs in SoC-level include =
files
at all. Our understanding is that the console getty is already handled
automatically by systemd-getty-generator from the console=3D kernel command
line argument, which makes SERIAL_CONSOLES potentially redundant for the co=
nsole
UART. Any additional UARTs beyond the console are board-specific and arguab=
ly
belong in each machine config rather than a shared SoC include.

We are not 100% certain about this reasoning and would love to hear the
rationale behind the current approach. Are we missing something? Would it m=
ake
sense to either remove SERIAL_CONSOLES from the SoC includes or at minimum =
use
 a weak assignment (?=3D) to allow boards to override cleanly?

Thanks,
Vitor Soares
Toradex


