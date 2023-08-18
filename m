Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4015C71148
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 13:32:02 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.11415.1692365519487979849
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 06:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jChX4g2x;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: perezmeyer@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bd6a34474cso692560a34.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 18 Aug 2023 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692365518; x=1692970318;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IG79/MewycXqVUEVhW+rheWIIvAyqZWqU8dOwoaGEqo=;
        b=jChX4g2xUH35Q/mPjq6F19/vSDThpPfsHQkSDDWf76X7Z8ZAlm4+frdAYgF5ngaiQ2
         Eu+gEHTEt8OTjjEi1tH/S4OfyEZbaI3W8IHJv+Enw9aONEyWYz4LVeA76cC+V1T09Q3+
         q3Ljw3ymnd3jyu2h343zjK7vI4GmySV+yw5WN1Z38mOPQDj1/zliX+VQN05sAeqhHceR
         bo/xLPdAz3wz5O7LUOtyl8ce6XwUzklsqfodnSx4Q8qPhEOCKgc8GgmD/by9TdN4HIy4
         B5wh3IqXDi5x7bgdKhavX+npt9yDp+G7jVlGoGo49daYXJ/5c1zDNEWuUC8JqDGITo5g
         nsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692365518; x=1692970318;
        h=mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IG79/MewycXqVUEVhW+rheWIIvAyqZWqU8dOwoaGEqo=;
        b=hoWy6RFFgxcdB/WS72Yk4kROzRM+W6AVa767KZfNNOmQucSV0/ixkpNGM0PV7WPd7u
         +T6QBoG920XX/4oI91VqiXagsAxzCHMGaoaowck4YE5FKxnhh7px0Z6Roqm5vX6nBJWk
         HytvG7kDevj3snndLGwI74IKnlUUaDpEvX75EmEDbKjxVXq/M8RgKN4cAW9qeJ1cATbE
         jwZ2+saBgHEFn+EH7hArfe/txlSX1gkVX6tOrV5m//Ug7wfln6IjvbaZpsMwvWZ+CCb+
         ceE9BEDxWcMn6cLu37z9I9t87c4bl3VodfWrGnZqvJJnutcHRBI4hjrGcsdB2buHH9oG
         aHlg==
X-Gm-Message-State: AOJu0YxqekNwNI2mHpi5YdHwrpbGU5PHiM6WtJwyY6IPvipJUe0yN5oj
	mRyET6HuQJ0ipe3x5DTbMOF/cPsIT5g=
X-Google-Smtp-Source: AGHT+IHpRi5VIZmwglc7SfpOuGTRBon4tiL3dHvbWEMTLEcSaDTOJTPj3QXf7p21CnpRwuMYSWubXA==
X-Received: by 2002:a05:6871:82a:b0:1a6:b183:b0ab with SMTP id q42-20020a056871082a00b001a6b183b0abmr3004070oap.40.1692365517597;
        Fri, 18 Aug 2023 06:31:57 -0700 (PDT)
Received: from gryffindor.localnet ([181.197.222.104])
        by smtp.gmail.com with ESMTPSA id i5-20020a056870344500b001bb919237cesm1018805oah.3.2023.08.18.06.31.55
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:31:55 -0700 (PDT)
From: 
 Lisandro =?ISO-8859-1?Q?Dami=E1n_Nicanor_P=E9rez?= Meyer
 <perezmeyer@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: beaglebone-ai64: i2c errors ooting with u-boot-ti-staging
Date: Fri, 18 Aug 2023 10:31:54 -0300
Message-ID: <3074167.fKoSnE5vHq@gryffindor>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3994152.GEWAqshInZ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Aug 2023 13:32:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16878

--nextPart3994152.GEWAqshInZ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
To: meta-ti@lists.yoctoproject.org
Subject: beaglebone-ai64: i2c errors ooting with u-boot-ti-staging
Date: Fri, 18 Aug 2023 10:31:54 -0300
Message-ID: <3074167.fKoSnE5vHq@gryffindor>
MIME-Version: 1.0

Hi, and hope I get the right list for this.

I have built poky's core-image-minimal for the BeagleBone AI64 using meta-t=
i's kirkstone layer, current HEAD. When I boot I get stuff like:

```
Hit any key to stop autoboot:  2 =08=08=08 1 =08=08=08 0=20
i2c_write: error waiting for data ACK (status=3D0x116)
pca953x gpio@22: Error reading output register
switch to partitions #0, OK
mmc1 is current device
i2c_write: error waiting for data ACK (status=3D0x116)
pca953x gpio@22: Error reading output register
SD/MMC found on device 1
=46ailed to load 'boot.scr'
=46ailed to load 'uEnv.txt'
i2c_write: error waiting for data ACK (status=3D0x116)
pca953x gpio@20: Error reading output register
i2c_write: error waiting for data ACK (status=3D0x116)
pca953x gpio@22: Error reading output register
```
and then I get stuck at=20

```
Waiting for root device PARTUUID=3D18b27b92-02
```

I rebooted, entered u-boot's prompt and run fuinduuid manually, which also =
causes an I=B2C-related error:

```
=3D> run finduuid
i2c_write: error waiting for data ACK (status=3D0x116)
pca953x gpio@22: Error reading output register
```

Am I doing something wrong here, or should I be filing a bug somewhere? Of =
course feel free to ask me for more details.

Thanks in advance, Lisandro.


--nextPart3994152.GEWAqshInZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEEt36hKwjsrvwSzE8q2RfQGKGp9AFAmTfcsoACgkQq2RfQGKG
p9DXUA/9HuIbEYgls7rYWzMcFowPUthimdYYEUy6dTFbH8bh3T/BSa3B0WNvpxzC
a/sehT+ounCkCysyW1wXabH7ddWg9dO7bVzO7O2NR/9iuNeyWLcNWIYofI7JBC9V
O1hrbIjtdG7rANUTT1hCZpfp5Z5XEWmhd0PAqUV/C6WwQ6phjXwsFpl0cTcAgY6N
DSydaQibDoCE4XQHA88eNHeTeBcDWZzr0O+pf8BT15Fa5Sacol7Vs4v/fiZ4h6nE
eDYzKfVAETKSTkGQQ+RAD8m8QZvXLc2cpMW5Cn2PqAoZfUvGHrwkTnVIx2tjEuR3
+MoVHXwCTctu116vVO3tA4HnbhQAUlYF4EP4g/vbbbdCP7/IIlNLXKidUJqqhJwx
JUOb0joFMFp5kGEfXgVAx7/as63AdgQBpZsfR7010ERk54rmYCgCFX+ApBVMdf5Y
ZzjO8WD9oIkleAt1/CAKcJj5/q3jHR40h1gRUUb5aK7MREx0JRUav58lulxTbUMH
3NA0QGjWFwozwMmkEFIlt8eYsIfdagj69B2PrGje252T8Wx5wEWWCZr4ZsOu7XX5
u5JOfS/iYoGZg0gw8mqEHXG5hfUMRDr76ojEPf8MVEa4PKtxCPMmipNBsDm3+NWo
yHWVexrOWOyzx4d/9Fo6uYmhTwWXICc7wpopZLXoNB1S0p7iSqE=
=0aEk
-----END PGP SIGNATURE-----

--nextPart3994152.GEWAqshInZ--




