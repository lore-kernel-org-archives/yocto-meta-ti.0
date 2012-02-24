Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 280B8E003E3
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2012 13:24:09 -0800 (PST)
Received: by bkcjm1 with SMTP id jm1so3566995bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2012 13:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of b.hutchman@gmail.com designates
	10.205.123.2 as permitted sender) client-ip=10.205.123.2; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of b.hutchman@gmail.com
	designates 10.205.123.2 as permitted sender)
	smtp.mail=b.hutchman@gmail.com;
	dkim=pass header.i=b.hutchman@gmail.com
Received: from mr.google.com ([10.205.123.2])
	by 10.205.123.2 with SMTP id gi2mr2008058bkc.76.1330118649171 (num_hops
	= 1); Fri, 24 Feb 2012 13:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GkUm/+Q04C0+8oEWl+p1PDDUbFy6oIsKo5SQkgx5d+s=;
	b=izPyKjKpYXaI48aK9bCcC2wihQQTk1cRQAoXjtII8yZKzuSfUd9mRQjkKVcfbyXc4A
	QlZmwPqEgDyAzGFkjNdsHvsfdgnQHiy0oOL4BMr42J3yoAA0qZFicv52EkD9RlCEM+5N
	uUR8BX4OALhiocanY3fgrgml1xTJb3r+pTOZQ=
MIME-Version: 1.0
Received: by 10.205.123.2 with SMTP id gi2mr1651313bkc.76.1330118649105; Fri,
	24 Feb 2012 13:24:09 -0800 (PST)
Received: by 10.204.229.198 with HTTP; Fri, 24 Feb 2012 13:24:09 -0800 (PST)
In-Reply-To: <CAFZh4h_NjvLfqjJfY6eMhESrNOubE5LWRqYwgnWxRndD=6w_qQ@mail.gmail.com>
References: <CAFZh4h909x+Ckk2Fed-YtEyZ_YhKJQV82=RHV++AE1mdp3DFGw@mail.gmail.com>
	<CAFZh4h_DZVM0-P6VjiZd4Czqiq5UGppS1qRhg2G7sKR5W2n5aw@mail.gmail.com>
	<E95BAB41-4F4A-4A90-A975-FFD882EB41F3@ti.com>
	<CAFZh4h_NjvLfqjJfY6eMhESrNOubE5LWRqYwgnWxRndD=6w_qQ@mail.gmail.com>
Date: Fri, 24 Feb 2012 16:24:09 -0500
Message-ID: <CAFZh4h-Vp=U-2fi9v6qEg43y6KFAkt2DQOS_Ev-2cvzXPWk8pw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
Subject: bitbake ti-syslink fails for MACHINE=c6a816x
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 21:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 4:21 PM, Brian Hutchinson <b.hutchman@gmail.com> wr=
ote:
> On Fri, Feb 24, 2012 at 4:07 PM, Monk, Roger <r-monk@ti.com> wrote:
>> I don't think it is worth spending too much time debugging this, since t=
his version of syslink is pretty old now and there will likely be further i=
ssues in this environment even if we can can get th build to complete, sinc=
e there are other related dependencies. =A0Best would be to look at adding =
the version >=3D those versions that are used in DVSDK 5.03. =A0This is pla=
nned, but we don't have a schedule at the moment. =A0If you have some time =
to help integrate these newer components it would be a big help.
>>
>> Thanks,
>> ~roger
>
I just need to get syslink and sysbios going on C6A816x & L138. =A0We
bitbake our rootfs image from Angstrom at the moment. =A0Can you advise
the best way to get syslink/sysbios going on these two targets? =A0Our
build machines a Linux based. =A0Should I be using the versions that are
packaged inside the ezsdk .bin file?

I can also help integrating but I might need some direction to get started.

Regards,

Brian

