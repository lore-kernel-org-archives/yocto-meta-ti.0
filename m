Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web09.12932.1619794620782346223
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 07:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o70xwPOT;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: alessioigorbogani@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id g38so83472660ybi.12
        for <meta-ti@lists.yoctoproject.org>; Fri, 30 Apr 2021 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LaIa8HaKuQCK70b1ibbc/ZvCMLDE2oiR9n5GzbNqClw=;
        b=o70xwPOT42TtUBTsEuH9fFFAC8dcsYyPGS7GYeeirKE5YWMBxrW7au7uq2I4jtxtBi
         pLvgjhD/y5VpNzBoi8y/SmQ3bKbQZDhHHglz1RosQ4jWwSe/sH+VTIFjt8Cv3yfFIewa
         HbCyrX75qeA74Mtbs37Ye3HzvguUs0BHgyV72nnW63q80q+psKZ9sS6nmVZrWBuV7hYZ
         uX+cCeYTqtfFmCgx5oN7OnN/srVQ8IF+7dlwcVuh2h4I8Cwb43eRL7vZY6WYjId+VhaN
         LwGrBHYkHw5PG+HtrpGEZOvrES3ivc0VhPfWTk+dbyyLA59pB/9ua9gwM/KZGIHQQFaN
         1jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LaIa8HaKuQCK70b1ibbc/ZvCMLDE2oiR9n5GzbNqClw=;
        b=O0/l4ku+oEdF8OFzWILwpSTu5A4T9u09sQizgF+5urDzfP/NzmQOHSKUMo09zesoog
         3JgfGT/dPZNcu2bocuzFTw743tvclppzI44m/jnMZhfO2+CvH/VwJbP9/DJkpvESA3o2
         rcredlu16kvG6jMF8vxSEkFFgcGhQM6YpZqx8g8gc2L89p4oPqra2nLSQKJqwu1xREWx
         Rzpsd4BdHr5MP8dowF1sAhFL+F8F51qc6hTr66fhtIqhlmQdAaUMybwOqkSlrFBm8quT
         Q564khwbSNwHSnJa8GcuJzuP16L0Y/lD2LbbPYvdZUydBAKGl0G6MZfsQo8cKy2dadj7
         dNAg==
X-Gm-Message-State: AOAM532AWG/24LCFXq8lsUt+irDXB1HgPBsO9tvbiXafgjsizu2+0XwK
	mhW4dQCJP4SxtqsEgZncv29GGnjsHMYLf4kq+TD05GzVBc1wwA==
X-Google-Smtp-Source: ABdhPJxZ/UUKm8+O/aTEpx/UV2yi1mybtLnjSc0Cg8I/sd9aDyuQWJ27zbWO96JhEt2wKId1Jx1Afgu0fRpkZrVLX0M=
X-Received: by 2002:a25:cf8c:: with SMTP id f134mr7352385ybg.216.1619794619429;
 Fri, 30 Apr 2021 07:56:59 -0700 (PDT)
MIME-Version: 1.0
From: "Alessio Igor Bogani" <alessioigorbogani@gmail.com>
Date: Fri, 30 Apr 2021 16:56:40 +0200
Message-ID: <CAPk1OjHUGA2hje_esMUtM0qWj_NcHeXev-B4oWGYKtD=RWGA2Q@mail.gmail.com>
Subject: Fail to build a kernel module
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The image core-image-kernel-dev cannot build a kernel module (*) if it
was generated using poky and meta-ti (both on dunfell branch) and
MACHINE=beaglebone . It works instead if the image was generated with
poky (without meta-ti) using MACHINE=beaglebone-yocto.

What I have done wrong?

Thanks!

Ciao,
Alessio


(*)
root@MiWiFi-R3600-srv:~/a2720-mod# make
make -C /lib/modules/5.4.106-g023faefa70/build M=/home/root/a2720-mod
make[1]: Entering directory '/lib/modules/5.4.106-g023faefa70/build'
  CC [M]  /home/root/a2720-mod/a2720.o
/tmp/cccIk672.s: Assembler messages:
/tmp/cccIk672.s:93: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:101: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:118: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:126: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:211: Error: selected processor does not support `isb '
in ARM mode
/tmp/cccIk672.s:225: Error: selected processor does not support `isb '
in ARM mode
/tmp/cccIk672.s:238: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:253: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:268: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:283: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:298: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:313: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:328: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:343: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:358: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:373: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:389: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:405: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:421: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:437: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:453: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:469: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:484: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:544: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:555: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:567: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:579: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:591: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:603: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:615: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:627: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:639: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:650: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:661: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:672: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:683: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:694: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:706: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:718: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:730: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:742: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:754: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:785: Error: selected processor does not support `isb '
in ARM mode
/tmp/cccIk672.s:799: Error: selected processor does not support `isb '
in ARM mode
/tmp/cccIk672.s:823: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:843: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:869: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:888: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:928: Error: selected processor does not support `isb '
in ARM mode
/tmp/cccIk672.s:943: Error: selected processor does not support `isb '
in ARM mode
/tmp/cccIk672.s:961: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:983: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:994: Error: selected processor does not support `dsb '
in ARM mode
/tmp/cccIk672.s:1005: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1016: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1027: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1038: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1049: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1060: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1071: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1082: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1094: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1106: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1118: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1130: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1142: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1154: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1165: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1214: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:1254: Error: selected processor does not support `isb
' in ARM mode
/tmp/cccIk672.s:1269: Error: selected processor does not support `isb
' in ARM mode
/tmp/cccIk672.s:1287: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:1326: Error: selected processor does not support `isb
' in ARM mode
/tmp/cccIk672.s:1566: Error: selected processor does not support `dsb
' in ARM mode
/tmp/cccIk672.s:1574: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:1593: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:1609: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/cccIk672.s:1774: Error: selected processor does not support `dsb
st' in ARM mode
make[2]: *** [scripts/Makefile.build:262: /home/root/a2720-mod/a2720.o] Error 1
make[1]: *** [Makefile:1734: /home/root/a2720-mod] Error 2
make[1]: Leaving directory '/lib/modules/5.4.106-g023faefa70/build'
make: *** [Makefile:7: all] Error 2
