Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.356.1582576747812316216
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 12:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aJGPhpcA;
 spf=pass (domain: konsulko.com, ip: 209.85.210.41, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f41.google.com with SMTP id z9so9981648oth.5
        for <meta-ti@lists.yoctoproject.org>; Mon, 24 Feb 2020 12:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=o1LclZCsbHU0e6gVbMmt8ldH9pIp2ky3LgcCeB7Ydt4=;
        b=aJGPhpcAHFRe74WUBpDDkCFSScFkfJANxg56q4u9vV/gXLwvX/9++5ootMTJkhNawb
         3WxQjk189SBM/pKImlGfoAtoNtiR2ptpmU/nYREWjomkFCij6rOuEkCEmtN+ONUr92CS
         cqCtIyv75K4JRdHFSaPTVpLtiw5bDaGdEfGlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=o1LclZCsbHU0e6gVbMmt8ldH9pIp2ky3LgcCeB7Ydt4=;
        b=NJGGZf69vngq4/RQiFW4Min9uolgr2Ic5rKFKyXrhrCUe9Q5YepHMwOP2uv7yYaIV4
         aTIKljcCLKa2lHMgEJ8eA2FWmC9KenR09BhXb8+9VvcAzYbf85auo6OfNnkCTKQe8m46
         L0+FX5SIWOPlJoDISg1mAZFtgXrVJ/EpcCLYP9zbcUlOp/82E0+o4u1Vh0QPCqRx/y1i
         ZpiDQEMy8ofJpvXECAWaflWgAvHKm5RXRG/4FvvAW3UuIcp0hI8fN1N5/IsRcKxbFejA
         73oS0+ABdeuR7BR5GF3ITL465kDZmXIcQ3pcYd1l1CWYxmutZ5GVHYHVOb2bwEvqmhzT
         yviw==
X-Gm-Message-State: APjAAAWSmRlwuicY+nrDURZIpg4jGXWWy++jDfuIMIlPWoWNkRtJaGdk
	2U0dG4+Ru6IE8iwZHD7gjXWRKJa4s+sa/fqrqb7SlL3a4EJUNA==
X-Google-Smtp-Source: APXvYqw35xyydj20Rs4L1c4VuB6PP1koul28T4bX6/w50zstLjQIpzfy29d+09PT+7RJFMgaxjQY+ZqVykyGtwgaSRE=
X-Received: by 2002:a9d:470a:: with SMTP id a10mr42586975otf.370.1582576746814;
 Mon, 24 Feb 2020 12:39:06 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt2_TZd4Xid-nJxNYkp_OThisAFJFGfwT7Y5NqE4qU06Kg@mail.gmail.com>
 <2596.1578907543790978429@lists.yoctoproject.org>
In-Reply-To: <2596.1578907543790978429@lists.yoctoproject.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 24 Feb 2020 20:38:56 +0000
Message-ID: <CAM9ZRVtT-8My0U+cem=O-BjK_WD6tG5fAto18x73qgooAMZNzw@mail.gmail.com>
Subject: Re: [meta-ti] issues with fetching git repos from git.ti.com
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

This happens pretty often for me, for example today:

    Cloning into bare repository
'/b/Sancloud/agl-master/demo-vayu/downloads/git2/git.ti.com.ivimm.ipumm.git'...
    fatal: unable to connect to git.ti.com:
    git.ti.com[0: 198.47.28.207]: errno=Connection timed out

    ERROR: ipumm-fw-3.00.15.00-r5 do_fetch: Fetcher failure for URL:
'git://git.ti.com/ivimm/ipumm.git;protocol=git'. Unable to fetch URL
from any source.

Is there anything that can be done about this?

Thanks,
Paul

On Mon, 13 Jan 2020 at 09:25, <linus.brandett@gmail.com> wrote:
>
> Hi,
>
> I dont want to hijack this thread but just to say that I have the same problem and Im located in Sweden.
>
> fatal: unable to connect to git.ti.com:
> git.ti.com[0: 198.47.28.207]: errno=Connection timed out
>
> Running git from terminal usually works better but not always.
>
> Its only TIs git servers thats causing problems, others work fine.
>
> /Linus 
