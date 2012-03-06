Return-Path: <ebutera@gmail.com>
Received: from mail-vw0-f48.google.com (mail-vw0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3B17E0070C
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 05:19:17 -0800 (PST)
Received: by vbjk17 with SMTP id k17so6157474vbj.35
	for <meta-ti@yoctoproject.org>; Tue, 06 Mar 2012 05:19:17 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.52.93.18 as permitted sender) client-ip=10.52.93.18; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.52.93.18 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.52.93.18])
	by 10.52.93.18 with SMTP id cq18mr41328832vdb.40.1331039957179
	(num_hops = 1); Tue, 06 Mar 2012 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=AlcdHX/clWEzv1umsFjSaKn6Tr7bSOnNZvgXHIml0BE=;
	b=QK5p7EzgNDwhGRmMsNWREQNgCuCBaD2fPTeiFuN6QwPN7/c1hSL4LcU7FSDpzVgDGr
	wINrzKQFrqDWpX3UoWtZCp1nANMCECPGJ3dv5oBsFQO+/rGQ/ugwsJdusrwxZ7SOBy7y
	ETaD+jtPEkmZNZZv1KOkD9+/09gfwnqbxZGdnqq7Tt7rdte3vqxbKi+yQNnRG27/Bjx1
	lq1LmOJ6DYiB0ZymPjTzbNRym4ptCYY6OYtjFE0a0SRWXFSKsKjsOu76qwQckI6b2daD
	cpc5oxBwlrB8r85F1wo/NjaTJMj2wrSFH0HL8r1z0s3bGBxcmd5Hmmmz36QW/Q5GwbPt
	mIkg==
MIME-Version: 1.0
Received: by 10.52.93.18 with SMTP id cq18mr35300239vdb.40.1331039957092; Tue,
	06 Mar 2012 05:19:17 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.220.157.70 with HTTP; Tue, 6 Mar 2012 05:19:17 -0800 (PST)
In-Reply-To: <4F560422.8050405@mlbassoc.com>
References: <4F560422.8050405@mlbassoc.com>
Date: Tue, 6 Mar 2012 14:19:17 +0100
X-Google-Sender-Auth: ExXDIkjzQlpU2r--1FElK8DSYiQ
Message-ID: <CA+2YH7uxmj86FdEbqmbrOD-W1Rii09PRhDjJ8HhoW7t20wSWDg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti vs meta-texasinstruments
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
X-List-Received-Date: Tue, 06 Mar 2012 13:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 1:33 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Why are there two layers, each seemingly providing support for
> TI products (boards, tools, etc)? =A0They have a great overlap,
> but many differences...
>
> Shouldn't there only be one such layer? =A0As is, the meta-texasinstrumen=
ts
> one seems to be rather out of date, but I'm not sure.

url of these layers? Maybe it's just an old reference in your setup
that is not getting updated (previously it was called
meta-texasinstruments and then it became meta-ti).

Enrico

