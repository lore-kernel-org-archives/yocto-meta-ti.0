Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04AAC004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 16:15:52 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.125006.1698077743490871766
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 09:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMi28bcr;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53dd752685fso5384429a12.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698077742; x=1698682542; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oe8a6WD/Vg7xPQPmD5mwxscO4nlXc0x2/Qt1hr93wIg=;
        b=UMi28bcrKUZiuUM2s0+qSx23jLxz063UOnqGoVI0fk/Oy2zvQcEz2w7jU5jtnTXMxc
         N+6XtiCJ2bgiDi/EJ5yZfxzNfD2fvgad2tdZhVX10404w1MdgfwXw5oNve7+iZBp5+gg
         CFQ6jUIB/cq5p3E5v2RA1dGEZG5w8aFIcog54ZrOkVYPxNzehhTshUyb60UpRB6NCrpg
         S+DF3BlSw6ftSyJRYJxliHNhbOSjHQbOwERscHiSZp6HlqHv5qWNppr/WIQswwP6sBi2
         v9HMKl5DrIWDKdv9RwUUK7kUaFBmqiQYivj7dswG/Rupc0Xe78Eynxi2CXLoYLJ7of4a
         s7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698077742; x=1698682542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oe8a6WD/Vg7xPQPmD5mwxscO4nlXc0x2/Qt1hr93wIg=;
        b=c/jIWqBgFG3ps6bW50fD505TCY2sWemtZmF2kocLuYDBn7/er5/kf7vybjvS46u7CX
         KzQLzeZfWvL+6lkL2Juwp/MI4M4WDC/I9E992DMs5yDFXO86wyBQ1b2jEpUDthEX5CST
         cFGFw3IeLAHPIoMS2WiSJoHs+lxCHdljkqH/OvLeXDm8s2UMSwr2xxog/5W9zACTiphd
         9kUZZeK+V4CU9J5CzuIhdiyKhJc7cZR90HxLWtQt4Jl5Rc3NUP3kgJLxuROl6i4nOIBl
         tj4LpOLMHJOTKxL3Q4uUwEdO3ckq6sXO5N/AMWRbmnVy+3+MfV9ZeulnvT/oz1oZSjTT
         L2cQ==
X-Gm-Message-State: AOJu0YyuQM9HFDK2NMUF8CAOB4pkMLjykGBoRLhmR/mKilXRuAPVbTeS
	qcIn9aEDWvSpikG+a8SKiwY=
X-Google-Smtp-Source: AGHT+IHn7fhHProeHQSIrXg2HoVM/vRJMT6/wu5hWFrkKRg/vVsyQ7iiflYxvLHf55knj0y2JyBSjg==
X-Received: by 2002:a05:6402:3493:b0:53e:f321:e6fd with SMTP id v19-20020a056402349300b0053ef321e6fdmr7739291edc.9.1698077741534;
        Mon, 23 Oct 2023 09:15:41 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id s21-20020a056402037500b0053e0395059csm6421445edw.21.2023.10.23.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 09:15:41 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com,
	meta-ti@lists.yoctoproject.org
Subject: [meta-ti][kirkstone] regression with rogue gpu
Date: Mon, 23 Oct 2023 13:15:38 -0300
Message-Id: <20231023161538.1798206-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 16:15:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17170

From: Max Krummenacher <max.krummenacher@toradex.com>

Hi

On our weekly CI build we see glmark segfaulting on our AM625 based SoM.

Reverting commit 9b6bce2c ("mesa-pvr: bump srcrev for sgx support") on
top of meta-ti @ 59edb4e8 ("linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202310191725")
fixes the segfault and glmark shows similar performance as before.

It looks like the addition of the SGX GPU introduced a regression with
the Rogue GPU.

Any comments?

Regards
Max


Image with meta-ti @ 59edb4e8 (tag: cicd.kirkstone.202310191725, tag: 09.01.00.001) linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202310191725:
```
root@verdin-am62-15133510:~# glmark2-es2-wayland 
=======================================================
    glmark2 2021.12
=======================================================
    OpenGL Information
    GL_VENDOR:     Imagination Technologies
    GL_RENDERER:   PowerVR A-Series AXE-1-16M
    GL_VERSION:    OpenGL ES 3.1 build 23.1@6404501
=======================================================
[build] use-vbo=false:
[   30.700147] kauditd_printk_skb: 12 callbacks suppressed
[   30.700219] audit: type=1701 audit(1698075022.084:20): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=701 comm="glmark2-es2-way" 
exe="/usr/bin/glmark2-es2-wayland" sig=11 res=1
Segmentation fault
```

Last weeks build looks fine:
meta-ti @ 1690e3fe (tag: cicd.kirkstone.202310121800) linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202310121800
```
root@verdin-am62-15133510:~# glmark2-es2-wayland 
=======================================================
    glmark2 2021.12
=======================================================
    OpenGL Information
    GL_VENDOR:     Imagination Technologies
    GL_RENDERER:   PowerVR A-Series AXE-1-16M
    GL_VERSION:    OpenGL ES 3.1 build 23.1@6404501
=======================================================
[build] use-vbo=false: FPS: 175 FrameTime: 5.714 ms
[build] use-vbo=true: FPS: 298 FrameTime: 3.356 ms
[texture] texture-filter=nearest: FPS: 309 FrameTime: 3.236 ms
[texture] texture-filter=linear: FPS: 302 FrameTime: 3.311 ms
[texture] texture-filter=mipmap: FPS: 279 FrameTime: 3.584 ms
[shading] shading=gouraud: FPS: 214 FrameTime: 4.673 ms
[shading] shading=blinn-phong-inf: FPS: 198 FrameTime: 5.051 ms
[shading] shading=phong: FPS: 144 FrameTime: 6.944 ms
[shading] shading=cel: FPS: 142 FrameTime: 7.042 ms
[bump] bump-render=high-poly: FPS: 107 FrameTime: 9.346 ms
[bump] bump-render=normals: FPS: 310 FrameTime: 3.226 ms
[bump] bump-render=height: FPS: 259 FrameTime: 3.861 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 117 FrameTime: 8.547 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 44 FrameTime: 22.727 ms
[pulsar] light=false:quads=5:texture=false: FPS: 389 FrameTime: 2.571 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 42 FrameTime: 23.810 ms
[desktop] effect=shadow:windows=4: FPS: 126 FrameTime: 7.937 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 52 FrameTime: 19.231 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 52 FrameTime: 19.231 ms
[buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 77 FrameTime: 12.987 ms
[ideas] speed=duration: FPS: 232 FrameTime: 4.310 ms
[jellyfish] <default>: FPS: 75 FrameTime: 13.333 ms
[terrain] <default>: FPS: 5 FrameTime: 200.000 ms
[shadow] <default>: FPS: 85 FrameTime: 11.765 ms
[refract] <default>: FPS: 11 FrameTime: 90.909 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 392 FrameTime: 2.551 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 238 FrameTime: 4.202 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 397 FrameTime: 2.519 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 310 FrameTime: 3.226 ms
[function] fragment-complexity=medium:fragment-steps=5: FPS: 102 FrameTime: 9.804 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 305 FrameTime: 3.279 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 305 FrameTime: 3.279 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 293 FrameTime: 3.413 ms
=======================================================
                                  glmark2 Score: 193 
=======================================================
```

