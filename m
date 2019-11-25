Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.111.1574705810165405691
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 10:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cT4ga+PY;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: raj.khem@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B44C3E00F84; Mon, 25 Nov 2019 10:16:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06BF2E00DAF
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 10:16:48 -0800 (PST)
Received: by mail-qt1-f195.google.com with SMTP id 14so18257278qtf.5
        for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 10:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/cFwQE/QwfqrWbKxRS6rKWQhzf+jFLDv0m0wcTo8Yg=;
        b=cT4ga+PY2ssVny7FKojOLxgnIrGrQ+EEq+nx9S817oPiqbXel+Y5RN9wS1A3/D2Kj/
         TEWCuS/yIhRFTgRcLvIbWyjRMDMKJn6FmGmbNTocdeiY9+5UeL7L1T5MPw6/5AK87MEC
         9s5nbt/1bBXcTycPeg5a+FFrQCdDGX+5VwWZ92bSoUt2JGC7/PI8NLtpk9c6tRdhHmLQ
         fTBEjr8fGH7DaWOA8isKksJ8xxzeSPXhRaREmz/axOmtamLVe4kq4eSVFuiP2vQDIADM
         qqdajpCZz7dm9qt1LPYNGjf98ekwi/voj6S1co1d2ibsjNvR/A4nMYLaDcJw46udGeSR
         zcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/cFwQE/QwfqrWbKxRS6rKWQhzf+jFLDv0m0wcTo8Yg=;
        b=RXz9hRYO+CDKsinXwUsbB9ap2XazXUCP6Ufdcpy0M6C6RPjiMn7hfkwI825/NIlbV7
         axqa0cF2ldII3YcQF7voOUqo/vnui1UQD5DO+8r6LfvX0JC87qEeyQa4eEn9btWw9vQm
         pXhffWHhCAGTpjMX+9aiEXKQP2JX7A2izNkmXKpGTZu0cSqL/UMdrZqq3vo5b9wL/6RO
         z4zRxbMhS+lSakCqYW+32tD0h/H7EOn1cSLtrUq5f3rU/+Em3AoLcrt8fuwytrROMUH7
         7BUHr2WKM0Vl5SZqOBlJ4qNCWwtq6nWytif51Hqycv1CzXa/XJim08wZtwSHk2U4UhN7
         GU0A==
X-Gm-Message-State: APjAAAU63iP/X0YnJHNpi5E9vvvGzbxFLnU0Nsr+b7y4c+qZTKykypAk
	4n4qWywqwV7/6+VgAPxD6TOFg6z1T+ikouICuAw=
X-Google-Smtp-Source: APXvYqyMwOlR/ffT7zoFvJKzxGjsxZQKTPrZtQj9FOAMhiAA/IgdfD23lJixh9IngzwV7T7jg8dz/JZrGPii7hB0yIc=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr30332460qtr.378.1574705807852;
 Mon, 25 Nov 2019 10:16:47 -0800 (PST)
MIME-Version: 1.0
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com> <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
 <20191125174203.GC4706@beryl> <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
In-Reply-To: <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 25 Nov 2019 10:16:20 -0800
Message-ID: <CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com>
Subject: Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>, meta-ti@yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <j-stiffler@ti.com> wrote:
>
>
> On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
> > On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
> >> On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
> >>> Recently individual components and LLD sources have been combined
> >>> into a single PDK repo. Use this class to specify the common source.
> >>> Also use this class to keep the sources separate from each other when
> >>> building. This keeps the build identical to previous recipes while
> >>> keeping control on interdependencies.
> >>>
> >>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>> ---
> > ...
> >>> +# Extract only required sources from PDK
> >>> +python do_unpack_append() {
> >>> +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> >>> +        import subprocess
> >>> +
> >>> +        src =
> >>> os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
> >>> PATH'))
> >>> +
> >>> +        # Package up only the required sources
> >>> +        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
> >>> d.getVar('S'))
> >>> +        subprocess.check_output(cmd, shell=True,
> >>> stderr=subprocess.STDOUT)
> >>> +
> >>> +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
> >>> +}
> >> perhaps looking in work-shared idea from kernel or gcc or clang
> >> packages could make it better where, you only untar sources once
> > Jake,
> >
> > Any updates on this - will you be looking into the above suggestion?
>
>
> I had originally considered this approach, but decided against it so
> that there would be no way a recipe could access other sources in the
> pdk.git.
>
> It may be a bit paranoid, but the work-shared approach would make the
> entire pdk sources available through a ti-pdk-fetch variable. I wanted
> it so that the entire pdk.git will never be unpacked in its entirety.

disk operations are not cheap, so you could save a lot by
having a monorepo. Is it due to access perms ? then its a single
tarballs you cant have ACLs. I am still not convinced if monorepo
approach has downsides, plus its a known approach elsewhere so
will be easy on users.

>
