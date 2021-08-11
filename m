Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3668.1628657398657663408
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 21:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DB5E40C1D;
	Wed, 11 Aug 2021 04:49:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gz58BFo6vF76; Wed, 11 Aug 2021 04:49:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C11E40BEC;
	Wed, 11 Aug 2021 04:49:55 +0000 (UTC)
Received: from [192.168.40.111] (unknown [192.168.40.111])
	by mail.denix.org (Postfix) with ESMTPSA id 90EF0174653;
	Wed, 11 Aug 2021 00:49:54 -0400 (EDT)
Date: Wed, 11 Aug 2021 00:49:53 -0400
Subject: Re: [EXTERNAL] [meta-ti] [PATCHv2] conf/machine: k3: Enable grub-efi by default in wic images
Message-ID: <884b4b04-dae4-49fe-9329-047438a17f58@email.android.com>
X-Android-Message-ID: <884b4b04-dae4-49fe-9329-047438a17f58@email.android.com>
In-Reply-To: <20210810181608.GK858@bill-the-cat>
From: "Denys Dmytriyenko" <denis@denix.org>
To: Tom Rini <trini@konsulko.com>
Cc: "Siraswar, Yogesh" <yogeshs@ti.com>, meta-ti@lists.yoctoproject.org
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9J2F1dG8nPk9rLCBJIGhhdmUgYSBmaXggZm9yIHRoaXMgLSB3aWxsIHNlbmQgdG9t
b3Jyb3cuLi48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEF1ZyAxMCwgMjAyMSAxNDox
NiwgVG9tIFJpbmkgJmx0O3RyaW5pQGtvbnN1bGtvLmNvbSZndDsgd3JvdGU6PGJyIHR5cGU9ImF0
dHJpYnV0aW9uIiAvPjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAg
MCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxwIGRp
cj0ibHRyIj5PbiBUdWUsIEF1ZyAxMCwgMjAyMSBhdCAxMTo0ODozNEFNIC0wNTAwLCBTaXJhc3dh
ciwgWW9nZXNoIHdyb3RlOiYjMTM7PGJyPgomIzEzOzxicj4KJmd0OyBUb20sJiMxMzs8YnI+CiZn
dDsgSSBhbSBydW5uaW5nIGludG8gYnVpbGQgaXNzdWUgYWZ0ZXIgaW50ZWdyYXRpbmcgdGhpcyB0
byBkdW5mZWxsLW5leHQuKFNlZSYjMTM7PGJyPgomZ3Q7IGF0dGFjaG1lbnQpJiMxMzs8YnI+CiZn
dDsgTGV0IG1lIGtub3cgaWYgSSBhbSBtaXNzaW5nIGFueXRoaW5nLiYjMTM7PGJyPgomIzEzOzxi
cj4KT0ssIEkgY2FuIHJlcHJvZHVjZSB0aGlzIHdpdGgganVzdCBvZS1jb3JlLCBtZXRhLWFybSBh
bmQmIzEzOzxicj4KbWV0YS1hcm0tdG9vbGNoYWluLCB1c2luZyBhbiBleHRlcm5hbCB0b29sY2hh
aW4uJm5ic3A7IFRoaXMgaXMgYSBmYWlsdXJlIG9mJiMxMzs8YnI+CnRoZSBleHRlcm5hbCB0b29s
Y2hhaW4uJm5ic3A7IEkgc3VnZ2VzdCB5b3UgcmFpc2UgdGhpcyBwcm9ibGVtIHdpdGggdGhlJiMx
Mzs8YnI+Cm1ldGEtYXJtIGZvbGtzIGFzIGJ1aWxkaW5nIGdydWItZWZpIGZvciBhYXJjaDY0IGlz
IGtpbmRhIGFuIGltcG9ydGFudCYjMTM7PGJyPgp1c2UgY2FzZSBmb3IgQXJtICh0aGUgY29tcGFu
eSkuJiMxMzs8YnI+CiYjMTM7PGJyPgotLSAmIzEzOzxicj4KVG9tJiMxMzs8L3A+CjxwIGRpcj0i
bHRyIj4mIzEzOzxicj4KJiMxMzs8YnI+CiYjMTM7PGJyPgo8L3A+CjwvYmxvY2txdW90ZT48L2Rp
dj48YnI+PC9kaXY+
