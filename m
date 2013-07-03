Return-Path: <exosyst@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22E32E01479
	for <meta-ti@yoctoproject.org>; Wed,  3 Jul 2013 08:39:35 -0700 (PDT)
Received: by mail-pb0-f43.google.com with SMTP id md12so242123pbc.16
	for <meta-ti@yoctoproject.org>; Wed, 03 Jul 2013 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=75t0niWnrJa4dArn6rSmFLsRzc2UrSNAmaNaf3QXQvE=;
	b=pQdBCSVuvuH0RBkxHb0ULNIS4JV0Q1mkXRuIx0HQNqKWg65DP0SzeBJOQLu84vi8+P
	YsLqWKhXwh6nPhBRkZjz0a4hTabxnRcoR/zx6EFO5gmavDveT/SgbLQON/H8IwgG/0M+
	+D38yQ2+NZW35Svo2ETVWrOj0x8H2mv+il8oH2+AZIzKvGE5o5QE65fa2mBiBttsRkT/
	RBjMLcYLHwseI5aDQ8SJrykRDZGs52aDSs6fHn6Ws0hrg+k/bIz5kMCwOz9iXgdujB9V
	BMKoFiQ2V3JrYr9FWH+Hhyo4M3+OxNrCyvVNejVY7iRP1tYgEvV/NbcTqlkDXmCnCj0I
	cRmg==
X-Received: by 10.66.119.196 with SMTP id kw4mr2984195pab.164.1372865975447;
	Wed, 03 Jul 2013 08:39:35 -0700 (PDT)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.70.95.97 with HTTP; Wed, 3 Jul 2013 08:39:15 -0700 (PDT)
From: Nick G <exosyst+metaTI@gmail.com>
Date: Wed, 3 Jul 2013 16:39:15 +0100
X-Google-Sender-Auth: U87H_bR-r6xd6fGYQONAcAPLTwA
Message-ID: <CAN-pQATKnJkwjYkfW8Vu+SfdpXr67j4irpMyqTfKjeoeCdArLA@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: License field in ti-hw-bringup-image
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 15:39:36 -0000
Content-Type: multipart/alternative; boundary=047d7b10c79dca739704e09d44ef

--047d7b10c79dca739704e09d44ef
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to build for the beaglebone using meta-ti and it returns an eror
due to a license field not being set in ti-hw-bringup-image.

Could someone check what the license should be for the bb and set it?

I know you can cludge it by setting

 BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor)/" in local.conf but
that doesn't really seem like a true fix.


Regards,
Nick

--047d7b10c79dca739704e09d44ef
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I&#39;m trying to build for the beaglebone using=
 meta-ti and it returns an eror due to a license field not being set in ti-=
hw-bringup-image.<br><br></div>Could someone check what the license should =
be for the bb and set it?<br>

<br></div><div>I know you can cludge it by setting<br><br>=A0BBMASK ?=3D &q=
uot;.*/meta-ti/recipes-(misc|bsp/formfactor)/&quot; in local.conf but that =
doesn&#39;t really seem like a true fix.<br><pre><br></pre></div>Regards,<b=
r>

Nick<br></div>

--047d7b10c79dca739704e09d44ef--
