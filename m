Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.10523.1581272831406254814
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 10:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DzKN7Xkp;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id j20so4345094qka.10
        for <meta-ti@lists.yoctoproject.org>; Sun, 09 Feb 2020 10:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=hYShSGeZKgeR8WZv6jIYi87VNFTcnmKyxC4fJRw4Vqo=;
        b=DzKN7XkpCje+1FO8AD/Wpz/SqvD5lHvJgAN0/g1fMwo8LAGBCppoJrDg8Nr3Fkm+gS
         W3ZR6d2EN2V76yZGkvbOZyiogPXvJUPLNvhwrdStp/7XAwt44YhkUKR7CW22+V+odfkT
         9KnH6bsq4mP/OTp/qks72maBebiX01YWvC5AlFHbN4gKlK17+b0y443hQIG0+v5IhPPk
         dneN8AS+o+LZEgNP9icPFbDf7igDyFuTH3bQbVNOv4dSbqou9umyxnl4zI3qj1iZPTji
         dOp3qARfhS7O7uRJ4C38ys7Y3WeRHNQWlqFEfWqWGG7Bdapd82RqlrJEae7SU4HDhw8i
         KtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hYShSGeZKgeR8WZv6jIYi87VNFTcnmKyxC4fJRw4Vqo=;
        b=adNToGNSNwzM500EB7YvgemnFrE49+318F9qMypdJI1aC7R1JiPrKvU9smkSMhGO9J
         2n0w0hJz4oMzZ3ikH5QZraUJfO6tdmNdMWM2SfKdA2hzzAdZYMtPbvIFlxXnWkMMGTZG
         fxqA4aMwvj+xxnJCh/yxYFunQAbHaKJUzwQnEVxsLNsg1XRD0w3Z4UExXzNn81ltCt4t
         mK6TalM2x9Yr4cqpGX1wFlq5obUW/DV8v+VGjS85nCmjenna7BzkVfazpz/rOoF/c5AS
         KfvlcvE5NcFRV7bgDrsh2C/pqTxXM49MawZSIRU+3mX/fzoUexsNhM3VAR/0djGznHOv
         X9SQ==
X-Gm-Message-State: APjAAAUblMJwby1DbYhiM75iwxDagnERh8eG7qwpfeMowWdOuKth2Snj
	F/Pof8ATHldr9NlgBzrF5xfzWy/7yUsFs1g+hJTLA6X3IdQ=
X-Google-Smtp-Source: APXvYqzvZLkzdm8LMh3zkGpdjJNgtm8F6QVgyTm4WL/fzJx3NVzMixeWqbtIPPci0mnF7e4N1Z8wOJhQ2vMGiaklqpg=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr7716403qkf.337.1581272830108;
 Sun, 09 Feb 2020 10:27:10 -0800 (PST)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 9 Feb 2020 10:26:44 -0800
Message-ID: <CAMKF1sqBztnkEciT045JbkeYyacjCe91b3FNCkv8k77DLEY=-g@mail.gmail.com>
Subject: ti-cgt6x bundling libc.a with unreadable ELF file header
To: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi

Recently, I am seeing below packaging error for ti-cgt6x

https://errors.yoctoproject.org/Errors/Details/390526/

eu-readelf also fails to read this file as well as binutils readelf
also complains

readelf: Error:
/mnt/b/yoe/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a(__TI_$$LIBINFO):
Failed to read file header

this libc.a is a binary blob so I cant find out how it is. built so
pinpoint where the problem
could be.

since these are DSP blobs should this be ignored from processing and
just dumped into rootfs
this will help packager turn a blind eye towards its contents or
should this be fixed and turned into
a readable ELF file by normal binutils. I doubt it being a problem
with tools, since I see same issue
with elfutils tools as well as binutils ELF manipulation tools.

Thanks
-Khem
