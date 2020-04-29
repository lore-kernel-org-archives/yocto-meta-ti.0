Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.109.1588149213667706790
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 01:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Q5v2U8B9;
 spf=pass (domain: konsulko.com, ip: 209.85.161.53, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f53.google.com with SMTP id i9so247070ool.5
        for <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2020 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=xzbOELf1VBzV90PAeAYqKMeVgA9yaXFX02cCLkbKH5w=;
        b=Q5v2U8B9JFCD+8H6moLB6P1thV8YVI2NOivJn283DyxcqlMGF2EbTtLMZTz29ChvEi
         fsnKSTT+fPOSGs2qMfDTnBft0xg3XBlaxg78nW/UwW6sQJERl6NUWPRDuRGIRXmUWQD8
         HEMDKAoIObOGFCO4hGzU0w/BA6LzqfuXvPsjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xzbOELf1VBzV90PAeAYqKMeVgA9yaXFX02cCLkbKH5w=;
        b=B+jPcEewBAyzHX9eXaDJSGutXWR0ruJvzTR00GWO1uZ18U5fuw+eXbXmu5ZjhEoOT9
         TttCCHKvcXlUBJF/6WYvwIH/xv9THZDarBKf6GIerhqOIixF2DBPUfmkvZwNNq+vhqj0
         eu5AtShMm29TezttzCYPOXDHmBYNXikc6kZ1gM2N7B4yEd/YtSRbkOTq3ga1l5GulTQj
         79ExDGoG5ywwUo5Iu3jv2V6/aCnBe0wuw/DauY4Zh7KS4XaRelHVMY6cwAZj6v+RWqvB
         4TtFcEmymOiiZcmJK4u4GahbC76+0iTVwOO9bTpXrbTAU7SfJS7L8OOGDpUGKstpf/Oe
         v9/Q==
X-Gm-Message-State: AGi0PuZ4ZZn99Ao6H8rGOyKD8r3LNdLzg4KLF5OhLHbis3SWGGcPwIdu
	qGvapUHIHCKLiLOg7g/UQcF0ZYZC9GbK4AXil2EJxdN2VhA=
X-Google-Smtp-Source: APiQypLxNt/a3hgXrgSBYLNc+dEL1BXumK8jMM/po/PpbHBieD+zjTf9aCNYggC8NyWSvrpeWLET+TWVxkmfO/wy9J4=
X-Received: by 2002:a4a:df01:: with SMTP id i1mr26769111oou.5.1588149212865;
 Wed, 29 Apr 2020 01:33:32 -0700 (PDT)
MIME-Version: 1.0
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 29 Apr 2020 09:33:22 +0100
Message-ID: <CAM9ZRVvLaQTzUH29DauqEgSuw21iRrKneGqB8i0SXy3OvW-08g@mail.gmail.com>
Subject: Arago & meta-ti support for Yocto Project LTS release
To: meta-ti@lists.yoctoproject.org, meta-arago@arago-project.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

Is there a plan to support the new Yocto Project LTS release (dunfell)
for Arago distro and meta-ti? I know usually every other Yocto Project
release is supported, zeus was supported so usually dunfell wouldn't
be.

If so, are you planning to support this for the full LTS period of 2 years?

I imagine this will be supported but would be good to get confirmation.

Thanks,
Paul
