Return-Path: <ross.burton@intel.com>
Received: from azsmga101.ch.intel.com (mga07.intel.com [143.182.124.22])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C89CE00294
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 15:43:06 -0800 (PST)
Received: from mail-ie0-f200.google.com ([209.85.223.200])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 21 Nov 2012 15:42:57 -0800
Received: by mail-ie0-f200.google.com with SMTP id 10so33133807ied.11
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 15:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=HLdvoDXrFkbQFeciJWhRyB9opsFFCj9RSBqWcHBBse8=;
	b=QjxF0uGQ7KH3LnbZiUQpJrDgGO4sQoeXtSpogfqPFnbLMiEwX7Yfxnn1Jp1mjrJl40
	KEY23FKZU8VA3IOG03ryEZHJGKlZSo1P6cyyN/QB6TK0S56qQfVTu8gtrH3qwfm3IgEs
	6kSlMptdOvkwBCx93yJlJfI8MiJpGOdwqjgMrFI6Ktd6flMj2Ax8jlaX9J/2/94bmIzO
	d1JglBfbdsx6yBHnWdMZxsaOsx0hz5gzylOP5OlKnwb9I7Vo9w2lj/zXN74z8MvmzPeE
	kvs6b7ipdkAFzx5OVuTeIjw6UD2BLqug1adn1D08pO8uB8uJjWYsTvaimPPwhqxEFTvJ
	kDLg==
Received: by 10.60.169.76 with SMTP id ac12mr1149348oec.88.1353541376139;
	Wed, 21 Nov 2012 15:42:56 -0800 (PST)
Received: by 10.60.169.76 with SMTP id ac12mr1149343oec.88.1353541376087; Wed,
	21 Nov 2012 15:42:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.154.37 with HTTP; Wed, 21 Nov 2012 15:42:35 -0800 (PST)
In-Reply-To: <CAJTo0LbCWQTs2aBBWvjeqXD-o6n48SfvBgBJCEFLN1kHtCPXiQ@mail.gmail.com>
References: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
	<CAJTo0LYLf=296eEZznK7vnFTJZhAS_u1opuXdyJ=MUvRYF1Asw@mail.gmail.com>
	<CAOT3miJf7yh=1c-xxfZ-sxZt4RUvufcgVTMv0Dzw=kSbz5wXaA@mail.gmail.com>
	<CAJTo0LbCWQTs2aBBWvjeqXD-o6n48SfvBgBJCEFLN1kHtCPXiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2012 23:42:35 +0000
Message-ID: <CAJTo0LZ5x=sm27TBgieofFebe84edDzUV19wbmVaBZ4ZDdyajw@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
X-Gm-Message-State: ALoCoQnl1XOKEttOyLR5B3VPoEH2GGRJsbEAuvoVwRVfl+xbgNzea//rI/mlhEqriJX1WCzfDwvYb7hX8Iku2oOEFZojyskcXwR4MZVmtZ7K9EzacDHXM4HJMjPRsgNLtmHlxrxiVjj907YoQ/IyyGr3BlhVRkd1dA==
X-Mailman-Approved-At: Wed, 21 Nov 2012 15:44:43 -0800
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, rob@ti.com,
	yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 23:43:06 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2012 23:33, Burton, Ross <ross.burton@intel.com> wrote:
> fdo - https://bugs.freedesktop.org/show_bug.cgi?id=57386
>
> I started replacing the AC_CHECK_FILE with PKG_CHECK_EXISTS, but now
> I'm wondering why DRI_CFLAGS DRM_CFLAGS are being used without being
> apparently defined.  Is this configure.ac needing a bit of a clean or
> am I misunderstanding something?

Looked a bit more, looks like 99% of the DRI checking code is dead, so
I've attached a patch to FDO #57386 which mostly deletes stuff.

(caveat: untested)

Ross

