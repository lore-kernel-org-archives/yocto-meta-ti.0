Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5999.1605965965164167010
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 21 Nov 2020 05:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CmyKaxSd;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: alessioigorbogani@gmail.com)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0E2AC38C07CE
	for <meta-ti@yoctoproject.org>; Sat, 21 Nov 2020 13:39:25 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id w5so11376325ybj.11
        for <meta-ti@yoctoproject.org>; Sat, 21 Nov 2020 05:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=g3WRHfNMvjo5JaDhBpwjPceE6UVZNzMZQYtdPzXIQlo=;
        b=CmyKaxSdf8ibWt8FDZwKWka+WMVMbQVUtvUQ+rwfenV+mKTNSA+CfPn02aavDhLWdt
         bgiawpHMzlfnKiIEB8cQqKhpZlREDtND9PRx5sNYQF1cEhJmkrWg4BnOJ1c2NNNLqjqn
         mrkkuz1NJ1d42dDa00v7qNPcNMcOkA5cmQ9LDAU07kViJqoqd/2M7bcnViRA5yFm/RBN
         RHEt6e3JAV4n3wEJHHcRAE33REvkna3GkhgCI2VdM5ToxshXus73VnzG3P5iVPEM87WM
         QUbWfw/s8cATDz96Hl9ZPoGOAfs2TbygZefYUzjwxjqUMaHbq11RH/RsBFIWJBYwenE5
         yyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=g3WRHfNMvjo5JaDhBpwjPceE6UVZNzMZQYtdPzXIQlo=;
        b=GzjO3DQpw8Es7++yle9rT7V/IbnJAVKDUFgUfB8Ey9Rchl5w/3pFxVd8L2ZOJSwBRi
         3rZWef21I6Bz87Fg8k5JhmxwV5kT5RxWXN3J2w+gXYf53u+RXg8KEEdMx5N4kj7A3lJ3
         /NuKd+NRhmUknzsID9CBXhFB7Wpy2elOzpjYm5AVmlRZuUHZbfbl6lhF5bw+c3ztx9zG
         N+sD/4RzqeZDhNMJWKYTec+8c0eYRgdHgiW30APxWruF9tfhFhhZbVKhxsHh4AuZPC0i
         R/wF/gFEJ7KqhfaVYprC+SZqWNzrrMOwWw5+zPM2X/0XEb7obhB2PR8IFQC9MouCPoat
         XWdQ==
X-Gm-Message-State: AOAM530qA1eKZATUzpnF279Q4hLPZmTDIQABiJbNPP5FxtK8QwjIiPyb
	8wzELOdXRx1hOh+coz6hEg2NTza7VQ7mtX/vmRvDfKI/qCQ=
X-Google-Smtp-Source: ABdhPJxuqsDa8jiXWa7OHesyUPR8j67CQFYLLjM11dz7euYCfwCxixNu1UprR9FzFztF6ImC2k9QNy8bawUhApfqYLQ=
X-Received: by 2002:a25:8249:: with SMTP id d9mr30352651ybn.464.1605965963576;
 Sat, 21 Nov 2020 05:39:23 -0800 (PST)
MIME-Version: 1.0
From: alessioigorbogani@gmail.com
Date: Sat, 21 Nov 2020 14:38:47 +0100
Message-ID: <CAPk1OjFOZMtf=Z02RVn6fFpEfr5BZA7eVSGtchOWJGDqHoXuFQ@mail.gmail.com>
Subject: nativesdk-ti-cgt-pru
To: meta-ti@yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I would like produce an SDK for the my image which includes clpru
compiler so I have added in my image's recipe:
TOOLCHAIN_HOST_TASK_append += "nativesdk-ti-cgt-pru"
Unfortunately it doesn't work:
Error:
 Problem: conflicting requests
  - nothing provides libpthread.so.0 needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libdl.so.2 needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libm.so.6 needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libc.so.6(GLIBC_2.3) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libdl.so.2(GLIBC_2.0) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libdl.so.2(GLIBC_2.1) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libm.so.6(GLIBC_2.0) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.0) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.1) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.2) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.2.3) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.3.2) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
(try to add '--skip-broken' to skip uninstallable packages or
'--nobest' to use not only best candidate packages)

What have I made wrong?

Thank you!

Ciao,
Alessio
